resource "aws_s3_account_public_access_block" "all" {
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_ebs_encryption_by_default" "all" {
  enabled = true
}

resource "aws_ebs_default_kms_key" "all" {
  key_arn = var.storage_kms_key_arn
}