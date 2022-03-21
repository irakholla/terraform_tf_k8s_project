provider "aws" {
    region                            = "${var.region}"
}

module "vpc" {
    source                            = "./modules/vpc"
    ipv4_cidr_block                   = var.ipv4_cidr_block
    enable_dns_support                = var.enable_dns_support
    enable_dns_hostnames              = var.enable_dns_hostnames
    instance_tenancy                  = var.instance_tenancy
    name_tag                          = var.name_tag
    # aws_subnet
    subnet_ip4_cidr_block             = var.subnet_ip4_cidr_block
    subnet_availability_zone          = data.aws_availability_zones.available.names[0]
    ec2_map_public_ip_on_launch       = var.ec2_map_public_ip_on_launch
    # aws_security_group
    securyty_group_name               = var.securyty_group_name
    ingress_from_port                 = var.ingress_from_port
    ingress_to_port                   = var.ingress_to_port
    ingres_protocol                   = var.ingres_protocol
    ingress_cidr_block                = var.ingress_cidr_block
    egress_from_port                  = var.egress_from_port
    egress_to_port                    = var.egress_to_port
    egress_protocol                   = var.egress_protocol
    egress_cidr_blocks                = var.egress_cidr_blocks
    # aws_route_table
    route_cidr_block                  = var.route_cidr_block
}

module "aws_key_pair" {
    source                            = "./modules/key_pair"
    key_pair_name                     = var.key_pair_name
    key_pair_public_key               = var.key_pair_public_key
}

module "aws_instance_k8s_masters" {
    source                                = "./modules/ec2_k8s_masters"
    number_of_masters                     = var.number_of_masters
    ec2_device_index_of_masters           = var.ec2_device_index_of_masters
    ec2_instance_type_of_masters          = var.ec2_instance_type_of_masters
    ec2_root_block_device_size_of_masters = var.ec2_root_block_device_size_of_masters
    ec2_ami_of_masters                    = var.ec2_ami_of_masters
    ec2_key_name                          = module.aws_key_pair.ec2_key_name
    name_tag_of_masters                   = var.name_tag_of_masters
    # aws_volume_attachment
    ebs_device_name                       = var.ebs_device_name
    # aws_network_interface
    vpc_subnet_id                         = module.vpc.vpc_subnet_id
    vpc_security_group_id                 = module.vpc.vpc_security_group_id
    # aws_ebs_volume
    ebs_availability_zone                 = data.aws_availability_zones.available.names[0]
    ebs_size_of_masters                   = var.ebs_size_of_masters
}

module "aws_instance_k8s_slaves" {
    source                                  = "./modules/ec2_k8s_slaves"
    number_of_slaves                        = var.number_of_slaves
    ec2_device_index_of_slaves              = var.ec2_device_index_of_slaves
    ec2_instance_type_of_slaves             = var.ec2_instance_type_of_slaves
    ec2_root_block_device_size_of_slaves    = var.ec2_root_block_device_size_of_slaves
    ec2_ami_of_slaves                       = var.ec2_ami_of_slaves
    ec2_key_name                            = module.aws_key_pair.ec2_key_name
    name_tag_of_slaves                      = var.name_tag_of_slaves
    # aws_volume_attachment
    ebs_device_name                         = var.ebs_device_name
    # aws_network_interface
    vpc_subnet_id                           = module.vpc.vpc_subnet_id
    vpc_security_group_id                   = module.vpc.vpc_security_group_id
    # aws_ebs_volume
    ebs_availability_zone                   = data.aws_availability_zones.available.names[0]
    ebs_size_of_slaves                      = var.ebs_size_of_slaves
}

# -------------------- Data ------------------------------

data "aws_availability_zones" "available" {
    state                                   = "available"
}
