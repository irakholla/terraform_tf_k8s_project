resource "aws_ebs_volume" "main_test_ebs_volume_masters" {
  count               = var.number_of_masters
  availability_zone   = var.ebs_availability_zone
  size                = var.ebs_size_of_masters

  tags = {
    Name = "${var.name_tag_of_masters}-${count.index+1}"
  }
}