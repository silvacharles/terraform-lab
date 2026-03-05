resource "aws_s3_bucket" "bucket" {
  bucket = "charlessilva-terraform-bucket"

  tags = {
    Name        = "Terraform bucket"
    Environment = "Dev"
  }
}