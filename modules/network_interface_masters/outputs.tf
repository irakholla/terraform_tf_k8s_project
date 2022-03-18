output "ec2_network_interface_id_for_masters" {
  value = aws_network_interface.main_test_network_interface_for_masters.*.id
}