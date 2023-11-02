resource "aws_instance" "ansible_host" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = var.tags

  key_name = var.key_name
}
