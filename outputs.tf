output "vpcid" {
  value = module.aws_vpc.vpcid
}

output "vpc_subnet_id" {
  value = module.aws_subnet.vpc_subnet_id
}

output "ec2_network_interface_id" {
  value = module.aws_network_interface.ec2_network_interface_id
}

output "vpc_cidr_block" {
  value = module.aws_vpc.vpc_cidr_block
}

output "vpc_security_group_id" {
  value = module.aws_security_group.vpc_security_group_id
}

output "ec2_key_name" {
  value = module.aws_key_pair.ec2_key_name
}

output "internet_gateway_id" {
  value = module.aws_internet_gateway.internet_gateway_id
}

output "vpc_main_route_table_id" {
  value = module.aws_route_table.vpc_main_route_table_id
}

output "ebs_volume_id" {
  value = module.aws_ebs_volume.ebs_volume_id
}

output "ebs_instance_id" {
  value = module.aws_instance.ebs_instance_id
}

output "s3_access_role_name" {
  value = module.aws_iam_role.s3_access_role_name
}

output "s3_access_role_id" {
  value = module.aws_iam_role.s3_access_role_id
}

output "s3" {
  value = module.aws_s3_bucket.bucketname
}