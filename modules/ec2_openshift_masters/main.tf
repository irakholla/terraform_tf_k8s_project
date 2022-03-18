resource "aws_instance" "ec2_openshift_masters" {
  count                         = var.number_of_masters
  ami                           = var.ec2_ami_of_masters
  instance_type                 = var.ec2_instance_type_of_masters
  key_name                      = var.ec2_key_name
  root_block_device {
    volume_size                 = var.ec2_root_block_device_size_of_masters
  }

  network_interface {
    network_interface_id        = var.ec2_network_interface_id_for_masters[count.index]
    device_index                = var.ec2_device_index_of_masters
  }

  tags = {
    Name = "${var.name_tag_of_masters}-${count.index+1}"
  }
}