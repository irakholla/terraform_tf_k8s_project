provider "aws" {
    region                            = "${var.region}"
}

module "random_id" {
    source                            = "./modules/random_id"
    number_of_instances               = var.number_of_instances
    for_random_byte_length            = var.for_random_byte_length
}

module "aws_ebs_volume" {
    source                            = "./modules/ebs"
    ebs_availability_zone             = data.aws_availability_zones.zones.names[0]
    ebs_size                          = var.ebs_size
    name_tag                          = var.name_tag
}

module "aws_ebs_volume_masters" {
    source                            = "./modules/ebs_masters"
    number_of_masters                 = var.number_of_masters
    ebs_availability_zone             = data.aws_availability_zones.zones.names[0]
    ebs_size_of_masters               = var.ebs_size_of_masters
    name_tag_of_masters               = var.name_tag_of_masters
}

module "aws_ebs_volume_slaves" {
    source                            = "./modules/ebs_slaves"
    number_of_slaves                  = var.number_of_slaves
    ebs_availability_zone             = data.aws_availability_zones.zones.names[0]
    ebs_size_of_slaves                = var.ebs_size_of_slaves
    name_tag_of_slaves                = var.name_tag_of_slaves
}

module "aws_s3_bucket" {
    source                            = "./modules/s3"
    bucket_name                       = var.bucket_name
    bucket_acl                        = var.bucket_acl
    name_tag                          = var.name_tag
    random_id_for_s3                  = module.random_id.random_id_for_s3
    number_of_instances               = var.number_of_instances
}

module "aws_vpc" {
    source                            = "./modules/vpc"
    ipv4_cidr_block                   = var.ipv4_cidr_block
    enable_dns_support                = var.enable_dns_support
    enable_dns_hostnames              = var.enable_dns_hostnames
    instance_tenancy                  = var.instance_tenancy
    name_tag                          = var.name_tag
}

module "aws_internet_gateway" {
    source                            = "./modules/internet_gateway"
    vpcid                             = module.aws_vpc.vpcid
    name_tag                          = var.name_tag
}

module "aws_subnet" {
    source                            = "./modules/subnet"
    vpcid                             = module.aws_vpc.vpcid
    subnet_ip4_cidr_block             = var.subnet_ip4_cidr_block
    subnet_availability_zone          = data.aws_availability_zones.zones.names[0]
    ec2_map_public_ip_on_launch       = var.ec2_map_public_ip_on_launch
    name_tag                          = var.name_tag
}

module "aws_network_interface" {
    source                            = "./modules/network_interface"
    vpc_subnet_id                     = module.aws_subnet.vpc_subnet_id
    vpc_security_group_id             = module.aws_security_group.vpc_security_group_id
    name_tag                          = var.name_tag
}

module "aws_network_interface_masters" {
    source                            = "./modules/network_interface_masters"
    number_of_masters                 = var.number_of_masters
    vpc_subnet_id                     = module.aws_subnet.vpc_subnet_id
    vpc_security_group_id             = module.aws_security_group.vpc_security_group_id
    name_tag_of_masters               = var.name_tag_of_masters
}

module "aws_network_interface_slaves" {
    source                            = "./modules/network_interface_slaves"
    number_of_slaves                  = var.number_of_slaves
    vpc_subnet_id                     = module.aws_subnet.vpc_subnet_id
    vpc_security_group_id             = module.aws_security_group.vpc_security_group_id
    name_tag_of_slaves                = var.name_tag_of_slaves
}

module "aws_key_pair" {
    source                            = "./modules/key_pair"
    key_pair_name                     = var.key_pair_name
    key_pair_public_key               = var.key_pair_public_key
}

module "aws_route_table" {
    source                            = "./modules/route_table"
    route_cidr_block                  = var.route_cidr_block
    internet_gateway_id               = module.aws_internet_gateway.internet_gateway_id
    vpcid                             = module.aws_vpc.vpcid
    name_tag                          = var.name_tag
}

module "aws_main_route_table_association" {
    source                            = "./modules/main_route_table_association"
    vpc_main_route_table_id           = module.aws_route_table.vpc_main_route_table_id
    vpcid                             = module.aws_vpc.vpcid
}

module "aws_instance" {
    source                            = "./modules/ec2"
    ec2_network_interface_id          = module.aws_network_interface.ec2_network_interface_id
    ec2_device_index                  = var.ec2_device_index
    ec2_instance_type                 = var.ec2_instance_type
    ec2_ami                           = var.ec2_ami
    ec2_root_block_device_size        = var.ec2_root_block_device_size
    ec2_key_name                      = module.aws_key_pair.ec2_key_name
    name_tag                          = var.name_tag
}

module "aws_instance_openshift_masters" {
    source                            = "./modules/ec2_openshift_masters"
    number_of_masters                 = var.number_of_masters
    ec2_network_interface_id_for_masters  = module.aws_network_interface_masters.ec2_network_interface_id_for_masters
    ec2_device_index_of_masters       = var.ec2_device_index_of_masters
    ec2_instance_type_of_masters      = var.ec2_instance_type_of_masters
    ec2_root_block_device_size_of_masters = var.ec2_root_block_device_size_of_masters
    ec2_ami_of_masters                = var.ec2_ami_of_masters
    ec2_key_name                      = module.aws_key_pair.ec2_key_name
    name_tag_of_masters               = var.name_tag_of_masters
}

module "aws_instance_openshift_slaves" {
    source                            = "./modules/ec2_openshift_slaves"
    number_of_slaves                  = var.number_of_slaves
    ec2_network_interface_id_for_slaves  = module.aws_network_interface_slaves.ec2_network_interface_id_for_slaves
    ec2_device_index_of_slaves        = var.ec2_device_index_of_slaves
    ec2_instance_type_of_slaves       = var.ec2_instance_type_of_slaves
    ec2_root_block_device_size_of_slaves = var.ec2_root_block_device_size_of_slaves
    ec2_ami_of_slaves                 = var.ec2_ami_of_slaves
    ec2_key_name                      = module.aws_key_pair.ec2_key_name
    name_tag_of_slaves                = var.name_tag_of_slaves
}

module "aws_security_group" {
    source                            = "./modules/security_group"
    securyty_group_name               = var.securyty_group_name
    vpcid                             = module.aws_vpc.vpcid
    ingress_from_port                 = var.ingress_from_port
    ingress_to_port                   = var.ingress_to_port
    ingres_protocol                   = var.ingres_protocol
    ingress_cidr_block                = var.ingress_cidr_block
    egress_from_port                  = var.egress_from_port
    egress_to_port                    = var.egress_to_port
    egress_protocol                   = var.egress_protocol
    egress_cidr_blocks                = var.egress_cidr_blocks
    name_tag                          = var.name_tag
}

module "aws_volume_attachment" {
    source                            = "./modules/volume_attachment"
    ebs_volume_id                     = module.aws_ebs_volume.ebs_volume_id
    ebs_instance_id                   = module.aws_instance.ebs_instance_id
    ebs_device_name                   = var.ebs_device_name
}

module "aws_volume_attachment_masters" {
    source                            = "./modules/volume_attachment_masters"
    number_of_masters                 = var.number_of_masters
    ebs_volume_id_masters             = module.aws_ebs_volume_masters.ebs_volume_id_masters
    ebs_instance_id_masters           = module.aws_instance_openshift_masters.ebs_instance_id_masters
    ebs_device_name                   = var.ebs_device_name
}

module "aws_volume_attachment_slaves" {
    source                            = "./modules/volume_attachment_slaves"
    number_of_slaves                  = var.number_of_slaves
    ebs_volume_id_slaves              = module.aws_ebs_volume_slaves.ebs_volume_id_slaves
    ebs_instance_id_slaves            = module.aws_instance_openshift_slaves.ebs_instance_id_slaves
    ebs_device_name                   = var.ebs_device_name
}

module "aws_iam_role" {
    source                            = "./modules/iam_role"
    s3_access_role_name               = var.s3_access_role_name
    s3_access_role_policy             = file("./assume_role_policy.json")
}

module "aws_iam_instance_profile" {
    source                            = "./modules/iam_instance_profile"
    s3_access_role_name               = module.aws_iam_role.s3_access_role_name
    s3_access_profile_name            = var.s3_access_profile_name
}

module "aws_iam_role_policy" {
    source                            = "./modules/iam_role_policy"
    s3_access_policy_name             = var.s3_access_policy_name
    s3_access_role_id                 = module.aws_iam_role.s3_access_role_id
    s3_access_policy                  = file("./policy.json")
}

# -------------------- Data ------------------------------

data "aws_availability_zones" "zones" {}