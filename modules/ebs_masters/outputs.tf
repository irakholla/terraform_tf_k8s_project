output "ebs_volume_id_masters" {
  value = aws_ebs_volume.main_test_ebs_volume_masters.*.id
}