variable "number_of_slaves" {
  type      = string
}

variable "ec2_ami_of_slaves" {
  type      = string
}

variable "ec2_instance_type_of_slaves" {
  type      = string
}

variable "ec2_device_index_of_slaves" {
  type      = string
}

variable "ec2_root_block_device_size_of_slaves" {
  type      = string
}

variable "ec2_network_interface_id_for_slaves" {
  type      = any
}

variable "ec2_key_name" {
  type      = string
}

variable "name_tag_of_slaves" {
  type      = string
}