# all

variable "number_of_masters" {
  type      = string
}

variable "name_tag_of_masters" {
  type      = string
}

# aws_instance

variable "ec2_ami_of_masters" {
  type      = string
}

variable "ec2_instance_type_of_masters" {
  type      = string
}

variable "ec2_device_index_of_masters" {
  type      = string
}

variable "ec2_root_block_device_size_of_masters" {
  type      = string
}

variable "ec2_key_name" {
  type      = string
}

# aws_volume_attachment

variable "ebs_device_name" {
  type      = string
}

# aws_network_interface

variable "vpc_subnet_id" {
  type      = string
}

variable "vpc_security_group_id" {
  type      = string
}

# aws_ebs_volume

variable "ebs_availability_zone" {
  type      = string
}

variable "ebs_size_of_masters" {
  type      = string
}