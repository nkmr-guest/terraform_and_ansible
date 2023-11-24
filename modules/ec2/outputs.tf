output "instance_public_ip" {
  value       = aws_instance.ec2.public_ip
  description = "Public IP of the Ansible Host"
}

output "instance_private_ip" {
  value       = aws_instance.ec2.private_ip
  description = "Private IP of the Ansible Host"
}

