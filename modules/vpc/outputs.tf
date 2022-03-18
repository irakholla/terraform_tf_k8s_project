output "vpcid" {
  value = aws_vpc.main_test_vpc.id
}

output "vpc_cidr_block" {
  value = aws_vpc.main_test_vpc.cidr_block
}