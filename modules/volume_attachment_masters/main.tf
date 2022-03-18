resource "aws_volume_attachment" "main_ebs_att_masters" {
  count                = var.number_of_masters
  device_name          = var.ebs_device_name
  volume_id            = var.ebs_volume_id_masters[count.index]
  instance_id          = var.ebs_instance_id_masters[count.index]
}