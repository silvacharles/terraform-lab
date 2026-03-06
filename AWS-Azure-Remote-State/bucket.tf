resource "aws_s3_bucket" "bucket_remote" {
  bucket = "charlessilva-remote-state"
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.bucket_remote.id
  versioning_configuration {
    status = "Enabled"
  }
}