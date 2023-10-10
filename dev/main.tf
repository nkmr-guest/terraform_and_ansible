provider "aws" {
  region = "ap-northeast-3"
}

resource "aws_instance" "ansible_host" {
  ami           = "ami-063cd3af637f3e426"
  instance_type = "t2.micro"

  tags = {
    Name = "AnsibleHost"
  }

  key_name = "test_ansible"
}

output "instance_ip" {
  value = aws_instance.ansible_host.public_ip
  description = "Public IP of the Ansible Host"
}
