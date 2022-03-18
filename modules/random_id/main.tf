resource "random_id" "main_random_id" {
    count                  = var.number_of_instances
    byte_length            = var.for_random_byte_length
}