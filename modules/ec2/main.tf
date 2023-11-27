resource "aws_instance" "ansible_host" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [
    var.sg_id
  ]
  subnet_id = var.public_subnet_id
  tags = var.tags

  key_name = var.key_name
}
