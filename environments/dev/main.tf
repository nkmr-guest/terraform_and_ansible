provider "aws" {
  region = "ap-northeast-1"
}


module "ansible_host" {
  source = "../../modules/ec2"

  ami        = "ami-0fd8f5842685ca887"
  tags       = {
    Name = "AnsibleHost"
  }
  key_name   = "test_ansible"
}

module "s3_bucket" {
  source = "../../modules/s3"

  bucket_name = "dev-terraform-bucket-name-3498403"
  tags        = {
    Environment = "Dev"
  }
}
