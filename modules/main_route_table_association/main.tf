resource "aws_main_route_table_association" "main_test_main_route_table_association" {
  vpc_id         = var.vpcid
  route_table_id = var.vpc_main_route_table_id
}