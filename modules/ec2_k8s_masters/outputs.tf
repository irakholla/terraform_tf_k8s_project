output "ebs_instance_id_masters" {
  value = aws_instance.ec2_k8s_masters.*.id
}