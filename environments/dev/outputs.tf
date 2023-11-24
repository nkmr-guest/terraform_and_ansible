output "instance_public_ip" {
  value       = module.ec2.instance_public_ip
  description = "Public IP of the Ansible Host"
}

output "instance_private_ip" {
  value = module.ec2.instance_private_ip
}
