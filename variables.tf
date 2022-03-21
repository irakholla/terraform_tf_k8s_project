variable "name_tag" {
  type      = string
  default   = "main_test"
}

# ---------------- aws_ebs_volume_masters ec2 module ----------------

variable "ebs_size_of_masters" {
  type      = string
  default   = "10"
}

# ---------------- aws_ebs_volume_slaves ec2 module ----------------

variable "ebs_size_of_slaves" {
  type      = string
  default   = "10"
}

# ---------------- main module ----------------

variable "region" {
  type      = string
  default   = "us-west-2"
}

# ---------------- vpc vpc module ----------------

variable "ipv4_cidr_block" {
  type      = string
  default   = "172.16.0.0/22"
}

variable "enable_dns_support" {
  type      = bool
  default   = true
}

variable "enable_dns_hostnames" {
  type      = bool
  default   = true
}

variable "instance_tenancy" {
  type      = string
  default   = "default"
}

# ---------------- vpc_subnet vpc module ----------------

variable "subnet_ip4_cidr_block" {
  type      = string
  default   = "172.16.0.0/24"
}

variable "ec2_map_public_ip_on_launch" {
  type      = bool
  default   = true
}

variable "subnet_availability_zone" {
  type      = string
  default   = "us-east-1a"
}

# ---------------- key_pair module ----------------

variable "key_pair_name" {
  type      = string
  default   = "main_test_key_pair"
}

variable "key_pair_public_key" {
  type      = string
  default   = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDStygijh1VHeP1iQqT2D4iPm+HNxegzuVpcoCmaRfJQBeI9zVrSsweMXrIuA592qOR7Ivk0Mt1QZ7u72aKZNoZCjOdg2Y/fJ5c41ZNx8fbTHZJAYjG6swYJdlztPG987HI2FNeLTIdtwXp3dwCuxNn8bVmA703G4L6O9ebQwwkrWwwwOCQye2Awmz5vhmtTQg8ppAEr84dR3sNTgpKIPg6qcFU0YiESFR7/ZfaLJMuuP1DBqKzbvvcBwcuM4D/lDhjuJOo5TTzWt7wReuziXby5UzWoIUWzbOTLx9FLkVNz7NKqi9Jf5NqkgFDixlxBVptAhOr4otZ6zrI9b8oFnbJ5A1DW698WnUK+5GmZO1PugXHHeDZOO5xF8UgdgwIqjqkHfynjRb0NZQd7q6o1n0JRMoVCYFd4lKLEQTbPctuS6uPV70OmpBUMLdUtYMvh50aabvzHw6XYkboBxc6T+ZD/7rlgxei+Ug3Wcv56Kb/6JJoz8moRKswODnAb+JbQKU= Ilia_Rakholla@EPRUPETW0799"
}


# ---------------- ec2_k8s_masters module ----------------

variable "number_of_masters" {
  type      = string
  default   = "2"
}

variable "ec2_ami_of_masters" {
  type      = string
  default   = "ami-0b28dfc7adc325ef4"
}

variable "ec2_instance_type_of_masters" {
  type      = string
  default   = "t2.micro"
}

variable "ec2_root_block_device_size_of_masters" {
  type      = string
  default   = "10"
}

variable "ec2_device_index_of_masters" {
  type      = string
  default   = "0"
}

variable "name_tag_of_masters" {
  type      = string
  default   = "main_test_master"
}

# ---------------- ec2_k8s_slaves module ----------------

variable "number_of_slaves" {
  type      = string
  default   = "2"
}

variable "ec2_ami_of_slaves" {
  type      = string
  default   = "ami-0b28dfc7adc325ef4"
}

variable "ec2_instance_type_of_slaves" {
  type      = string
  default   = "t2.micro"
}

variable "ec2_root_block_device_size_of_slaves" {
  type      = string
  default   = "10"
}

variable "ec2_device_index_of_slaves" {
  type      = string
  default   = "0"
}

variable "name_tag_of_slaves" {
  type      = string
  default   = "main_test_slave"
}

# ---------------- route_table vpc module ----------------

variable "route_cidr_block" {
  type      = string
  default   = "0.0.0.0/0"
}

# ---------------- security_group vpc module ----------------

variable "securyty_group_name" {
  type      = string
  default   = "allow_ssh"
}

variable "ingress_from_port" {
  type      = string
  default   = "22"
}

variable "ingress_to_port" {
  type      = string
  default   = "22"
}

variable "ingres_protocol" {
  type      = string
  default   = "tcp"
}

variable "ingress_cidr_block" {
  type      = string
  default   = "193.9.4.10/32"
}

variable "egress_from_port" {
  type      = string
  default   = "0"
}

variable "egress_to_port" {
  type      = string
  default   = "0"
}

variable "egress_protocol" {
  type      = string
  default   = "-1"
}

variable "egress_cidr_blocks" {
  type      = string
  default   = "0.0.0.0/0"
}

# ---------------- volume_attachment ec2 module ----------------

variable "ebs_device_name" {
  type      = string
  default   = "/dev/sdh"
}