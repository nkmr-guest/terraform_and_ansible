resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  rule {
    object_ownership = "BucketOwnerEnforced"
  }
  tags = var.tags
}
