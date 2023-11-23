module "ec2_sg" {
  source = "../../modules/security_group"

  sg_config = {
    name        = "ec2_sg"
    vpc_id      = module.vpc.vpc_id
    protocol    = "tcp"
    port        = [22, 80, 443]
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ansible_host" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [module.ec2_sg.sg_id]  
  
  tags = var.tags

  key_name = var.key_name
}
