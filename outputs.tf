output "slaves_public_dns" {
  value = module.aws_instance_k8s_slaves.*.slaves_public_dns
}

output "masters_public_dns" {
  value = module.aws_instance_k8s_masters.*.masters_public_dns
}