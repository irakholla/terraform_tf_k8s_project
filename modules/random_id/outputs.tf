output "random_id_for_s3" {
  value = random_id.main_random_id.*.dec
}