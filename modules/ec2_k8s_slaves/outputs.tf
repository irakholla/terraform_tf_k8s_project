output "ebs_instance_id_slaves" {
  value = aws_instance.ec2_k8s_slaves.*.id
}