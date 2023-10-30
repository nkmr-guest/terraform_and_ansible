// backend.tf
terraform {
  backend "s3" {
    bucket         = "dev-terraform-state-bucket-6523369580"
    key            = "terraform.tfstate"
    region         = "ap-northeast-1"
    encrypt        = true
  }
}
