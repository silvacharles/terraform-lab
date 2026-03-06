terraform {
  required_version = ">= 1.14.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.35.0"
    }
  }
   backend "s3" {
    bucket = "charlessilva-remote-state"
    key    = "aws-vpc/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      owner      = "charlessilva"
      managed-by = "terraform"
    }
  }
}