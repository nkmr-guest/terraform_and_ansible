output "instance_public_ip" {
  value       = aws_instance.ansible_host.public_ip
  description = "Public IP of the Ansible Host"
}

output "instance_private_ip" {
  value       = aws_instance.ansible_host.private_ip
  description = "Private IP of the Ansible Host"
}

output "sg_id" {
  value = aws_security_group.ec2_security_group.id
}