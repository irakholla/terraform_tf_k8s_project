resource "aws_instance" "main_test_ec2" {
  ami                           = var.ec2_ami
  instance_type                 = var.ec2_instance_type 
  key_name                      = var.ec2_key_name
  root_block_device {
    volume_size                 = var.ec2_root_block_device_size
  }

  network_interface {
    network_interface_id        = var.ec2_network_interface_id
    device_index                = var.ec2_device_index
  }

  tags = {
    Name = var.name_tag
  }
}