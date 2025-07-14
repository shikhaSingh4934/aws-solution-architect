resource "aws_s3_bucket" "my-tf-s3-bucket-sh5465" {
  bucket = "my-tf-test-bucket-sh5465"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}   
