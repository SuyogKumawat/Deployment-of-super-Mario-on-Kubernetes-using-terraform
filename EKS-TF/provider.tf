terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider and region you can specify
#If you launch using EC2 then no need to put access key and secret key


provider "aws" {
  region = "ap-south-1"
}
