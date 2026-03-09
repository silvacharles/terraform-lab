resource "aws_s3_bucket" "bucket1" {
  bucket = "charlessilva-terraform-commands1"

  tags = {
    Name        = "Terraform bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "bucket2" {
  bucket = "charlessilva-terraform-commands2"

  tags = {
    Name        = "Terraform bucket"
    Environment = "Dev"
  }
}


resource "aws_s3_bucket" "bucket3" {
  bucket = "charlessilva-terraform-commands3"

  tags = {
    Name        = "Terraform bucket"
    Environment = "Dev"
  }
}