provider "aws" {
  region = "ap-northeast-1"

  max_retries = 2  # タイムアウトが発生した場合にリトライする回数
  retry_delay  = 5  # リトライの間隔（秒）
}

module "vpc" {
  source = "../../modules/vpc"

  vpc_config = {
    NameTag              = "MyVPC"
    cidr_block           = "10.2.0.0/16"
    enable_dns_support   = true
    enable_dns_hostnames = true
    subnet_count         = 2
  }
}

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

module "ec2" {
  source = "../../modules/ec2"

  ami        = "ami-0fd8f5842685ca887"
  tags       = {
    Name = "AnsibleHost"
  }
  key_name   = "ssh_ec2_instance"
  ec2_config = {
    vpc_id           = module.vpc.vpc_id
    public_subnet_id = module.vpc.public_subnet_id
    sg_id            = module.ec2_sg.sg_id
  }
}

module "s3_bucket" {
  source = "../../modules/s3"

  bucket_name = "dev-terraform-bucket-name-3498403"
  bucket_acl  = "private"  // または任意のACL設定
  tags        = {
    Environment = "Dev"
  }
}

