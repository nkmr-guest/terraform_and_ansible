output "instance_public_ip" {
  value       = module.ansible_host.instance_public_ip
  description = "Public IP of the Ansible Host"
}

output "instance_private_ip" {
  value = module.ansible_host.instance_private_ip
}
