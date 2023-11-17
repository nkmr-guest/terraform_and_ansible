// backend.tf
terraform {
  backend "s3" {
    bucket	   = "dev-terraform-bucket-name-3498403"
    key            = "terraform.tfstate"
    region         = "ap-northeast-1"
    encrypt        = true
  }
}
