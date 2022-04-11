output "ebs_instance_id_masters" {
  value = aws_instance.ec2_k8s_masters.*.id
}

output "masters_public_dns" {
  value = aws_instance.ec2_k8s_masters.*.public_dns
}