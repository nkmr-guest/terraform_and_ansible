output "instance_ip" {
  value       = aws_instance.ansible_host.public_ip
  description = "Public IP of the Ansible Host"
}
