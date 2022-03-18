resource "aws_iam_role" "s3_access_role" {
  name               = var.s3_access_role_name
  assume_role_policy = var.s3_access_role_policy
}