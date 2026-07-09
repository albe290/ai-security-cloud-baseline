variable "logs_kms_key_id" {
  description = "KMS key ID used to encrypt the SNS alert topic"
  type        = string
}

variable "account_id" {
  description = "AWS account ID for budget and SNS topic policy scoping"
  type        = string
}

variable "budget_limit_usd" {
  description = "Monthly budget limit in USD"
  type        = string
  default     = "25"
}