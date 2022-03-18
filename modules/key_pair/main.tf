resource "aws_key_pair" "main_test_key_pair" {
  key_name   = var.key_pair_name
  public_key = var.key_pair_public_key
}