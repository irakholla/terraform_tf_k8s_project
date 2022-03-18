output "ebs_volume_id_slaves" {
  value = aws_ebs_volume.main_test_ebs_volume_slaves.*.id
}