resource "aws_subnet" "main_test_subnet" {
  vpc_id                  = var.vpcid
  cidr_block              = var.subnet_ip4_cidr_block
  availability_zone       = var.subnet_availability_zone
  map_public_ip_on_launch = var.ec2_map_public_ip_on_launch

  tags = {
    Name = var.name_tag
  }
}