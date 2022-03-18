output "bucketname" {
  value = "${join(", ", aws_s3_bucket.main_test_s3_bucket.*.id)}"
}