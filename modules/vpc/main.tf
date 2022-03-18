resource "aws_vpc" "main_test_vpc" {
  cidr_block               = var.ipv4_cidr_block
  enable_dns_support       = var.enable_dns_support
  enable_dns_hostnames     = var.enable_dns_hostnames
  instance_tenancy         = var.instance_tenancy

  tags = {
    Name = var.name_tag
  }
}