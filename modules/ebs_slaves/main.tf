resource "aws_ebs_volume" "main_test_ebs_volume_slaves" {
  count               = var.number_of_slaves
  availability_zone   = var.ebs_availability_zone
  size                = var.ebs_size_of_slaves

  tags = {
    Name = "${var.name_tag_of_slaves}-${count.index+1}"
  }
}