resource "aws_secretsmanager_secret" "app" {
  name                    = "ai-security/${var.app_name}"
  description             = "AI Security baseline application secret container"
  kms_key_id              = var.secrets_kms_key_id
  recovery_window_in_days = 7
}