terraform {
  backend "s3" {
    bucket = "my-s3-bucket-tf"
    key    = "main"
    region = "us-east-1"
    dynamodb_table = "my-dynamodb-table"
  }
}


