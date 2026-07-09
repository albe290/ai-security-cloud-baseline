output "vpc_id" {
  value = aws_vpc.main.id
}

output "private_subnet_id" {
  value = aws_subnet.private.id
}

output "ai_workload_security_group_id" {
  value = aws_security_group.ai_workload.id
}

output "bedrock_endpoint_security_group_id" {
  value = aws_security_group.bedrock_endpoint.id
}

output "bedrock_runtime_endpoint_id" {
  value = aws_vpc_endpoint.bedrock_runtime.id
}