variable "region" {
  description = "AWS region for the AI Security Cloud Baseline"
  type        = string
  default     = "us-east-1"
}

variable "account_id" {
  description = "AWS account ID"
  type        = string
}

variable "app_name" {
  description = "Application name for baseline resources"
  type        = string
  default     = "ai-security-baseline"
}

variable "workload_actions" {
  description = "Allowed AWS actions for AI workload permission boundary"
  type        = list(string)
}

variable "budget_limit_usd" {
  description = "Monthly budget limit in USD"
  type        = string
  default     = "25"
}