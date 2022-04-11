# all

variable "name_tag" {
  type      = string
}

# aws_vpc

variable "ipv4_cidr_block" {
  type      = string
}

variable "enable_dns_support" {
  type      = string
}

variable "enable_dns_hostnames" {
  type      = string
}

variable "instance_tenancy" {
  type      = string
}

# aws_subnet

variable "subnet_ip4_cidr_block" {
  type      = string
}

variable "subnet_availability_zone" {
  type      = string
}

variable "ec2_map_public_ip_on_launch" {
  type      = string
}

# aws_security_group
# ssh

variable "security_group_name_ssh" {
  type      = string
}

variable "ingress_from_port_ssh" {
  type      = string
}

variable "ingress_to_port_ssh" {
  type      = string
}

variable "ingres_protocol_ssh" {
  type      = string
}

variable "ingress_cidr_block_ssh" {
  type      = string
}

variable "egress_from_port_ssh" {
  type      = string
}

variable "egress_to_port_ssh" {
  type      = string
}

variable "egress_protocol_ssh" {
  type      = string
}

variable "egress_cidr_blocks_ssh" {
  type      = string
}

# internal

variable "security_group_name_internal" {
  type      = string
}

variable "ingress_from_port_internal" {
  type      = string
}

variable "ingress_to_port_internal" {
  type      = string
}

variable "ingres_protocol_internal" {
  type      = string
}

variable "ingress_cidr_block_internal" {
  type      = string
}

variable "egress_from_port_internal" {
  type      = string
}

variable "egress_to_port_internal" {
  type      = string
}

variable "egress_protocol_internal" {
  type      = string
}

variable "egress_cidr_blocks_internal" {
  type      = string
}

# aws_route_table

variable "route_cidr_block" {
  type      = string
}