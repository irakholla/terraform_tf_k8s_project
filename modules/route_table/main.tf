resource "aws_route_table" "main_test_route_table" {
  vpc_id = var.vpcid

  route {
    cidr_block = var.route_cidr_block
    gateway_id = var.internet_gateway_id
  }

  tags = {
    Name = var.name_tag
  }
}