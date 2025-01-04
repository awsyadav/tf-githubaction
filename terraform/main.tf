# main.tf
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # You'll configure this later
  backend "s3" {}
}

provider "aws" {
  region = "us-east-1"
}

# Example resource
resource "aws_s3_bucket" "example" {
  bucket = "my-test-bucket-${random_string.suffix.result}"
}

resource "random_string" "suffix" {
  length  = 8
  special = false
  upper   = false
}

##########################################