resource "aws_s3_bucket" "temi_bucket" {
  bucket = local.s3-sufix
}