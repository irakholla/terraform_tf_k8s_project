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

variable "vpcid" {
  type      = string
}

variable "name_tag" {
  type      = string
}