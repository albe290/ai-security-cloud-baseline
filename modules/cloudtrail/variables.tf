variable "account_id" {
  description = "AWS account ID"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "logs_kms_key_arn" {
  description = "KMS key ARN used to encrypt CloudTrail logs"
  type        = string
}

variable "logs_kms_key_id" {
  description = "KMS key ID used for CloudTrail KMS key policy"
  type        = string
}