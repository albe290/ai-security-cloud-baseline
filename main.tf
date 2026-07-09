terraform {
  required_version = ">= 1.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket  = "ai-security-tfstate-800417964045"
    key     = "baseline/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}

provider "aws" {
  region = var.region
}

module "kms" {
  source = "./modules/kms"
}

module "iam" {
  source                    = "./modules/iam"
  workload_boundary_actions = var.workload_actions
}

module "secrets" {
  source             = "./modules/secrets"
  app_name           = var.app_name
  secrets_kms_key_id = module.kms.secrets_key_id
}

module "cloudtrail" {
  source           = "./modules/cloudtrail"
  account_id       = var.account_id
  region           = var.region
  logs_kms_key_arn = module.kms.logs_key_arn
  logs_kms_key_id  = module.kms.logs_key_id
}
module "vpc" {
  source = "./modules/vpc"
  region = var.region
}
module "logs" {
  source           = "./modules/logs"
  logs_kms_key_arn = module.kms.logs_key_arn
}
module "account_defaults" {
  source              = "./modules/account_defaults"
  storage_kms_key_arn = module.kms.storage_key_arn
}
module "budgets" {
  source           = "./modules/budgets"
  account_id       = var.account_id
  logs_kms_key_id  = module.kms.logs_key_id
  budget_limit_usd = var.budget_limit_usd
}