variable "app_name" {
  description = "Application name used for naming the Secrets Manager secret"
  type        = string
}

variable "secrets_kms_key_id" {
  description = "KMS key ID used to encrypt Secrets Manager secrets"
  type        = string
}