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

'''commands to run 
need to connect to provider which is in main tf feom terrafrom website copy pasted
terraform init ---to intialize it, download some files like.lock.hcl
terraform plan---(give change state like cloudformation)
terraform apply ---creates the bucket
terraform destroy---destroy it '''