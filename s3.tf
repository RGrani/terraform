resource "aws_s3_bucket" "my_s3_bucket" {
  bucket_prefix = var.bucket_prefix
  versioning {
  enabled = var.versioning
  }
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
resource "aws_s3_bucket_acl" "acl" {
  bucket = aws_s3_bucket.my-s3-bucket.id
  acl    = "private"
}
