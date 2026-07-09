output "alerts_topic_arn" {
  value = aws_sns_topic.alerts.arn
}

output "budget_name" {
  value = aws_budgets_budget.master.name
}

output "anomaly_monitor_arn" {
  value = aws_ce_anomaly_monitor.account.arn
}

output "anomaly_subscription_arn" {
  value = aws_ce_anomaly_subscription.account.arn
}