resource "aws_instance" "ec2_k8s_slaves" {
  count                         = var.number_of_slaves
  ami                           = var.ec2_ami_of_slaves
  instance_type                 = var.ec2_instance_type_of_slaves
  key_name                      = var.ec2_key_name
  root_block_device {
    volume_size                 = var.ec2_root_block_device_size_of_slaves
  }

  network_interface {
    network_interface_id        = aws_network_interface.main_test_network_interface_for_slaves[count.index].id
    device_index                = var.ec2_device_index_of_slaves
  }

  tags = {
    Name = "${var.name_tag_of_slaves}-${count.index+1}"
  }
}

resource "aws_volume_attachment" "main_ebs_att_slaves" {
  count                = var.number_of_slaves
  device_name          = var.ebs_device_name
  volume_id            = aws_ebs_volume.main_test_ebs_volume_slaves[count.index].id
  instance_id          = aws_instance.ec2_k8s_slaves[count.index].id
}

resource "aws_network_interface" "main_test_network_interface_for_slaves" {
  count               = var.number_of_slaves
  subnet_id           = var.vpc_subnet_id
  security_groups     = [var.vpc_security_group_id]

  tags = {
    Name = "${var.name_tag_of_slaves}-${count.index+1}"
  }
}

resource "aws_ebs_volume" "main_test_ebs_volume_slaves" {
  count               = var.number_of_slaves
  availability_zone   = var.ebs_availability_zone
  size                = var.ebs_size_of_slaves

  tags = {
    Name = "${var.name_tag_of_slaves}-${count.index+1}"
  }
}