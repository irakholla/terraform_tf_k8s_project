resource "aws_network_interface" "main_test_network_interface" {
  subnet_id   = var.vpc_subnet_id
  security_groups = [var.vpc_security_group_id]

  tags = {
    Name = var.name_tag
  }
}