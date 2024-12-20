terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.8"
    }
  }

  backend "s3" {
    bucket = "devops-kotte-site"
    key = "remote-for-each"
    region = "us-east-1"
    dynamodb_table = "devops-kotte-site-table"
    
  }
}

provider "aws" {
    region = "us-east-1" 
}