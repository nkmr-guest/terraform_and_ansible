output "instance_ip" {
  value       = module.ansible_host.public_ip
  description = "Public IP of the Ansible Host"
}

output "instance_private_ip" {
  value = module.ansible_host.instance_ip
}
