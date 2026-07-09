resource "aws_iam_policy" "workload_boundary" {
  name = "ai-security-workload-boundary"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = var.workload_boundary_actions
        Resource = "*"
      },
      {
        Effect    = "Deny"
        NotAction = var.workload_boundary_actions
        Resource  = "*"
      }
    ]
  })
}

resource "aws_iam_role" "workload" {
  name                 = "ai-security-workload"
  permissions_boundary = aws_iam_policy.workload_boundary.arn

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}