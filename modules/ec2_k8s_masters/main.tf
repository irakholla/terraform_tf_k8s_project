resource "aws_instance" "ec2_k8s_masters" {
  count                         = var.number_of_masters
  ami                           = var.ec2_ami_of_masters
  instance_type                 = var.ec2_instance_type_of_masters
  key_name                      = var.ec2_key_name
  root_block_device {
    volume_size                 = var.ec2_root_block_device_size_of_masters
  }

  network_interface {
    network_interface_id        = aws_network_interface.main_test_network_interface_for_masters[count.index].id
    device_index                = var.ec2_device_index_of_masters
  }

  tags = {
    Name = "${var.name_tag_of_masters}-${count.index+1}"
  }
}

resource "aws_volume_attachment" "main_ebs_att_masters" {
  count                = var.number_of_masters
  device_name          = var.ebs_device_name
  volume_id            = aws_ebs_volume.main_test_ebs_volume_masters[count.index].id
  instance_id          = aws_instance.ec2_k8s_masters[count.index].id
}

resource "aws_network_interface" "main_test_network_interface_for_masters" {
  count               = var.number_of_masters
  subnet_id           = var.vpc_subnet_id
  security_groups     = var.vpc_security_group_id

  tags = {
    Name = "${var.name_tag_of_masters}-${count.index+1}"
  }
}

resource "aws_ebs_volume" "main_test_ebs_volume_masters" {
  count               = var.number_of_masters
  availability_zone   = var.ebs_availability_zone
  size                = var.ebs_size_of_masters

  tags = {
    Name = "${var.name_tag_of_masters}-${count.index+1}"
  }
}