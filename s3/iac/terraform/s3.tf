resource "aws_s3_bucket" "my-tf-s3-bucket" {
  bucket = "my-tf-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}                                       