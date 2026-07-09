resource "aws_cloudwatch_log_group" "app" {
  name              = "/ai-security/app"
  retention_in_days = 30
  kms_key_id        = var.logs_kms_key_arn
}

resource "aws_cloudwatch_log_group" "tools" {
  name              = "/ai-security/tools"
  retention_in_days = 30
  kms_key_id        = var.logs_kms_key_arn
}

resource "aws_cloudwatch_log_group" "model" {
  name              = "/ai-security/model"
  retention_in_days = 30
  kms_key_id        = var.logs_kms_key_arn
}