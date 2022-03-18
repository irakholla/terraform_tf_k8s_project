resource "aws_volume_attachment" "main_ebs_att_slaves" {
  count                = var.number_of_slaves
  device_name          = var.ebs_device_name
  volume_id            = var.ebs_volume_id_slaves[count.index]
  instance_id          = var.ebs_instance_id_slaves[count.index]
}