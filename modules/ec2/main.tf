resource "aws_instance" "ansible_host" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [var.ec2_security_group.sg_id]  
  
  tags = var.tags

  key_name = var.key_name
}
