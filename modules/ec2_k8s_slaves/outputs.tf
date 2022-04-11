output "ebs_instance_id_slaves" {
  value = aws_instance.ec2_k8s_slaves.*.id
}

output "slaves_public_dns" {
  value = aws_instance.ec2_k8s_slaves.*.public_dns
}