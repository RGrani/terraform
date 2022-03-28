resource "aws_s3_bucket" "my-s3-bucket" {
  bucket_prefix = var.bucket_prefix
  versioning {
  enabled = var.versioning
  tags = var.tags
}
}
resource "aws_s3_bucket_acl" "acl" {
  bucket = aws_s3_bucket.my-s3-bucket.id
  acl    = "private"
}
