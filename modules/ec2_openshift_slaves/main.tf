resource "aws_instance" "ec2_openshift_slaves" {
  count                         = var.number_of_slaves
  ami                           = var.ec2_ami_of_slaves
  instance_type                 = var.ec2_instance_type_of_slaves
  key_name                      = var.ec2_key_name
  root_block_device {
    volume_size                 = var.ec2_root_block_device_size_of_slaves
  }

  network_interface {
    network_interface_id        = var.ec2_network_interface_id_for_slaves[count.index]
    device_index                = var.ec2_device_index_of_slaves
  }

  tags = {
    Name = "${var.name_tag_of_slaves}-${count.index+1}"
  }
}