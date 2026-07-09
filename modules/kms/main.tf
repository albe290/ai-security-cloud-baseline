resource "aws_kms_key" "storage" {
  description             = "AI Security baseline: storage encryption"
  enable_key_rotation     = true
  deletion_window_in_days = 7
}

resource "aws_kms_key" "secrets" {
  description             = "AI Security baseline: secrets encryption"
  enable_key_rotation     = true
  deletion_window_in_days = 7
}

resource "aws_kms_key" "logs" {
  description             = "AI Security baseline: log encryption"
  enable_key_rotation     = true
  deletion_window_in_days = 7
}