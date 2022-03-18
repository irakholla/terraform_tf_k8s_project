resource "aws_s3_bucket" "main_test_s3_bucket" {
  count  = var.number_of_instances
  bucket = "${var.bucket_name}-${var.random_id_for_s3[count.index]}"
  acl    = var.bucket_acl

  tags = {
    Name = "${var.name_tag}-${count.index+1}"
  }
}