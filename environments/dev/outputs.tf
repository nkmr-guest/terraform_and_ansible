output "instance_ip" {
  value       = aws_instance.ansible_host.public_ip
  description = "Public IP of the Ansible Host"
}

output "instance_private_ip" {
  value = module.ec2_module.instance_ip
}
