resource "aws_volume_attachment" "main_ebs_att" {
  device_name = var.ebs_device_name
  volume_id   = var.ebs_volume_id
  instance_id = var.ebs_instance_id
}