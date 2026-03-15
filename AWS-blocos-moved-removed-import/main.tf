terraform {
  required_version = ">= 1.14.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.36.0"
    }
  }
  backend "s3" {
    bucket = "charlessilva-remote-state"
    key    = "moved-removed-import/terraform.tfstate"
    region = "sa-east-1"
  }
}

provider "aws" {
  region = "sa-east-1"
  default_tags {
    tags = {
      owner      = "charlessilva"
      managed-by = "terraform"
    }
  }
}