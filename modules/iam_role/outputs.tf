output "s3_access_role_name" {
  value = aws_iam_role.s3_access_role.name
}

output "s3_access_role_id" {
  value = aws_iam_role.s3_access_role.id
}