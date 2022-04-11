output "vpcid" {
  value = aws_vpc.main_test_vpc.id
}

output "vpc_cidr_block" {
  value = aws_vpc.main_test_vpc.cidr_block
}

output "vpc_subnet_id" {
  value = aws_subnet.main_test_subnet.id
}

output "vpc_security_group_id_internal" {
  value = aws_security_group.main_test_security_group_internal.id
}

output "vpc_security_group_id_ssh" {
  value = aws_security_group.main_test_security_group_ssh.id
}