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
    # ssh
    security_group_name_ssh           = var.security_group_name_ssh
    ingress_from_port_ssh             = var.ingress_from_port_ssh
    ingress_to_port_ssh               = var.ingress_to_port_ssh
    ingres_protocol_ssh               = var.ingres_protocol_ssh
    ingress_cidr_block_ssh            = var.ingress_cidr_block_ssh
    egress_from_port_ssh              = var.egress_from_port_ssh
    egress_to_port_ssh                = var.egress_to_port_ssh
    egress_protocol_ssh               = var.egress_protocol_ssh
    egress_cidr_blocks_ssh            = var.egress_cidr_blocks_ssh
    # internal
    security_group_name_internal      = var.security_group_name_internal
    ingress_from_port_internal        = var.ingress_from_port_internal
    ingress_to_port_internal          = var.ingress_to_port_internal
    ingres_protocol_internal          = var.ingres_protocol_internal
    ingress_cidr_block_internal       = var.ingress_cidr_block_internal
    egress_from_port_internal         = var.egress_from_port_internal
    egress_to_port_internal           = var.egress_to_port_internal
    egress_protocol_internal          = var.egress_protocol_internal
    egress_cidr_blocks_internal       = var.egress_cidr_blocks_internal
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
    vpc_security_group_id                 = [module.vpc.vpc_security_group_id_ssh, module.vpc.vpc_security_group_id_internal]
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
    vpc_security_group_id                   = [module.vpc.vpc_security_group_id_ssh, module.vpc.vpc_security_group_id_internal]
    # aws_ebs_volume
    ebs_availability_zone                   = data.aws_availability_zones.available.names[0]
    ebs_size_of_slaves                      = var.ebs_size_of_slaves
}

# -------------------- Data ------------------------------

data "aws_availability_zones" "available" {
    state                                   = "available"
}
