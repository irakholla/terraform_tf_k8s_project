output "ebs_instance_id_slaves" {
  value = aws_instance.ec2_openshift_slaves.*.id
}