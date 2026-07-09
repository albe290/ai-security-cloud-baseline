variable "alerts_sns_topic_arn" {
  description = "SNS topic ARN used for security and cost alerts"
  type        = string
}

variable "account_id" {
  description = "AWS account ID"
  type        = string
}