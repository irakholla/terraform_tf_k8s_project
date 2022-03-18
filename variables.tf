variable "name_tag" {
  type      = string
  default   = "main_test"
}

# ---------------- random_id module ----------------

variable "number_of_instances" {
  type      = string
  default   = "1"
}

variable "for_random_byte_length" {
  type      = string
  default   = "2"
}

# ---------------- aws_ebs_volume module ----------------

variable "ebs_availability_zone" {
  type      = string
  default   = "us-east-1a"
}

variable "ebs_size" {
  type      = string
  default   = "1"
}

# ---------------- aws_ebs_volume_masters module ----------------

variable "ebs_size_of_masters" {
  type      = string
  default   = "1"
}

# ---------------- aws_ebs_volume_slaves module ----------------

variable "ebs_size_of_slaves" {
  type      = string
  default   = "1"
}

# ---------------- s3_bucket module ----------------

variable "bucket_name" {
  type      = string
  default   = "main-test-s3-bucket-for-test-projects"
}

variable "bucket_acl" {
  type      = string
  default   = "private"
}

# ---------------- main module ----------------

variable "region" {
  type      = string
  default   = "us-east-1"
}

# ---------------- vpc module ----------------

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

# ---------------- vpc_subnet module ----------------

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
  default   = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDYhcZZZ7I6cY/aGeq29Pe8q4ltt/AF4qL/teC6LvaLPOdUQZlt83IRzcTz16uA8ZxjROBEo9eOwIkekDBM6VwxL6xPPkTIcjZMRw1GU6Y47AqRTC4l/HXUBzSbGDp/ejHx6NeaQeh1aCEclt+yRCkR2Fn4gdOn/TTDZrDMcqTxHrhyiXvUww3+RyL4nvbY4FVHKINaLhjKW+Whp/+2oL7lNsID/hwDvz0Ve8+PlsMKxfnEbiYCnAugOPHS/dztpRuD2NzJifGHpAWAhBiHElEjVrUdkiI/+feSpaZqyN4s6iuIUquUz8XBI6ckJ9N3Qei5ZYBVTRnNke99D5THI1xN8uL2+CfITGQcSoTUnOSLi7ksUKRf6UdLHsX12vUtQHHUP+3L2TqE+YWJNpvWwpxXbp65WF4lX8lhnVxa0jbYq5Cv4w+DmG8dB3/z9c/dUbcjEjzdSoGdbzPTbsqVNW1Xz8VEo6zdQXX3GbXM5n8J3YVdYSXWCzf1y2wR10Ynofs= Ilia_Rakholla@EPRUPETW0597"
}

# ---------------- ec2 module ----------------

variable "ec2_ami" {
  type      = string
  default   = "ami-02e136e904f3da870"
}

variable "ec2_instance_type" {
  type      = string
  default   = "t2.micro"
}

variable "ec2_root_block_device_size" {
  type      = string
  default   = "8"
}

variable "ec2_device_index" {
  type      = string
  default   = "0"
}

# ---------------- ec2_openshift_masters module ----------------

variable "number_of_masters" {
  type      = string
  default   = "1"
}

variable "ec2_ami_of_masters" {
  type      = string
  default   = "ami-02e136e904f3da870"
}

variable "ec2_instance_type_of_masters" {
  type      = string
  default   = "t2.micro"
}

variable "ec2_root_block_device_size_of_masters" {
  type      = string
  default   = "8"
}

variable "ec2_device_index_of_masters" {
  type      = string
  default   = "0"
}

variable "name_tag_of_masters" {
  type      = string
  default   = "main_test_master"
}

# ---------------- ec2_openshift_slaves module ----------------

variable "number_of_slaves" {
  type      = string
  default   = "1"
}

variable "ec2_ami_of_slaves" {
  type      = string
  default   = "ami-0aeeebd8d2ab47354"
}

variable "ec2_instance_type_of_slaves" {
  type      = string
  default   = "t2.micro"
}

variable "ec2_root_block_device_size_of_slaves" {
  type      = string
  default   = "8"
}

variable "ec2_device_index_of_slaves" {
  type      = string
  default   = "0"
}

variable "name_tag_of_slaves" {
  type      = string
  default   = "main_test_slave"
}

# ---------------- route_table module ----------------

variable "route_cidr_block" {
  type      = string
  default   = "0.0.0.0/0"
}

# ---------------- security_group module ----------------

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
  default   = "0.0.0.0/0"
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

# ---------------- volume_attachment module ----------------

variable "ebs_device_name" {
  type      = string
  default   = "/dev/sdh"
}

# ---------------- iam_role module ----------------

variable "s3_access_role_name" {
  type      = string
  default   = "s3_access_role"
}

# ---------------- iam_role_policy module ----------------

variable "s3_access_policy_name" {
  type      = string
  default   = "s3_access_policy"
}

# ---------------- iam_instance_profile module ----------------

variable "s3_access_profile_name" {
  type      = string
  default   = "s3_access_profile"
}