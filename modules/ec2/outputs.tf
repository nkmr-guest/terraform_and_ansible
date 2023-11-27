output "instance_public_ip" {
  #value       = aws_instance.ansible_host.public_ip
  value       = aws_instance.ansible_host[count.index].public_ip
  description = "Public IP of the Ansible Host"
}

output "instance_private_ip" {
  #value       = aws_instance.ansible_host.private_ip
  value       = aws_instance.ansible_host[count.index].private_ip
  description = "Private IP of the Ansible Host"
}

