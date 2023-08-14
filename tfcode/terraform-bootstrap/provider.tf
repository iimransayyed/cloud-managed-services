terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region  = "ap-south-1"
  profile = "default"
}

#terraform backend
terraform {
  backend "s3" {
    bucket         = "061058055367-terraform-backend-state"
    key            = "terraform-bootstrap/terraform.tfstate"
    dynamodb_table = "061058055367-terraform-state-lock"
    encrypt        = true
    region         = "ap-south-1"
  }
}