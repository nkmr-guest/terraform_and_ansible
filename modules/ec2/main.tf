resource "aws_instance" "ansible_host" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [
    var.ec2_config.sg_id
  ]
  subnet_id = element(var.ec2_config.public_subnet_id, count.index % length(var.ec2_config.public_subnet_id))
  tags = var.tags

  key_name = var.key_name
}
