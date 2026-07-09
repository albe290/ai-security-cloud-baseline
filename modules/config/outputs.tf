output "guardduty_detector_id" {
  value = aws_guardduty_detector.main.id
}

output "s3_encryption_config_rule_name" {
  value = aws_config_config_rule.s3_encryption.name
}

output "s3_public_access_config_rule_name" {
  value = aws_config_config_rule.s3_public_access.name
}