output "storage_key_arn" {
  value = aws_kms_key.storage.arn
}

output "secrets_key_id" {
  value = aws_kms_key.secrets.key_id
}

output "logs_key_arn" {
  value = aws_kms_key.logs.arn
}

output "logs_key_id" {
  value = aws_kms_key.logs.key_id
}