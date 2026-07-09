output "app_log_group_name" {
  value = aws_cloudwatch_log_group.app.name
}

output "tools_log_group_name" {
  value = aws_cloudwatch_log_group.tools.name
}

output "model_log_group_name" {
  value = aws_cloudwatch_log_group.model.name
}