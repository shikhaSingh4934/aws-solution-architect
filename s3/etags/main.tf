terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.3.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

resource "aws_s3_bucket" "default" {
  }

resource "aws_s3_object" "object_info" {
  bucket = resource.aws_s3_bucket.default.id
  key    = "myfile.txt"
 
  etag = filemd5("myfile.txt")
}

# we can't do this example in cloudformation because it take iac seriously and objects don't comes unde infrastrcture so we cant create objects in cloudformation