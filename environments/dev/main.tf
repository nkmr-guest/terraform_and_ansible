provider "aws" {
  region = "ap-northeast-1"
}


module "ansible_host" {
  source = "../../modules/ec2"

  ami        = "ami-0fd8f5842685ca887"
  tags       = {
    Name = "AnsibleHost"
  }
  key_name   = "ssh_ec2_instance"
}

module "s3_bucket" {
  source = "../../modules/s3"

  bucket_name = "dev-terraform-bucket-name-3498403"
  bucket_acl  = "private"  // または任意のACL設定
  tags        = {
    Environment = "Dev"
  }
}
