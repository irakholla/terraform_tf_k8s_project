resource "aws_iam_role_policy" "s3_access_policy" {
  name   = var.s3_access_policy_name
  role   = var.s3_access_role_id
  policy = var.s3_access_policy
}