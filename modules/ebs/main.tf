resource "aws_ebs_volume" "main_test_ebs_volume" {
  availability_zone   = var.ebs_availability_zone
  size                = var.ebs_size

  tags = {
    Name = var.name_tag
  }
}