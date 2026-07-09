output "s3_public_access_block_enabled" {
  value = true
}

output "ebs_encryption_by_default_enabled" {
  value = aws_ebs_encryption_by_default.all.enabled
}

output "ebs_default_kms_key_arn" {
  value = aws_ebs_default_kms_key.all.key_arn
}