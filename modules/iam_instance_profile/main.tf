resource "aws_iam_instance_profile" "s3_access_profile" {
  name   = var.s3_access_profile_name
  role   = var.s3_access_role_name
}