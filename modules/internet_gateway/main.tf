resource "aws_internet_gateway" "main_test_internet_gateway" {
  vpc_id = var.vpcid

  tags = {
    Name = var.name_tag
  }
}