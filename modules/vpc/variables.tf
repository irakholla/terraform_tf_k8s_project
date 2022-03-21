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

variable "securyty_group_name" {
  type      = string
}

variable "ingress_from_port" {
  type      = string
}

variable "ingress_to_port" {
  type      = string
}

variable "ingres_protocol" {
  type      = string
}

variable "ingress_cidr_block" {
  type      = string
}

variable "egress_from_port" {
  type      = string
}

variable "egress_to_port" {
  type      = string
}

variable "egress_protocol" {
  type      = string
}

variable "egress_cidr_blocks" {
  type      = string
}

# aws_route_table

variable "route_cidr_block" {
  type      = string
}