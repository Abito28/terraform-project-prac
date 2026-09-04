resource "aws_s3_bucket" "log-storage" {
  bucket = "my-log-storage-buccket"
}

#block pblic access
resource "aws_s3_bucket_public_access_block" "log-storage-block" {
  bucket                  = aws_s3_bucket.log-storage.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}