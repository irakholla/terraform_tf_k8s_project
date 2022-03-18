resource "aws_network_interface" "main_test_network_interface_for_masters" {
  count               = var.number_of_masters
  subnet_id           = var.vpc_subnet_id
  security_groups     = [var.vpc_security_group_id]

  tags = {
    Name = "${var.name_tag_of_masters}-${count.index+1}"
  }
}