locals {
  name_prefix = "ai-security"
}

resource "aws_vpc" "main" {
  cidr_block           = "10.50.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "${local.name_prefix}-vpc"
  }
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.50.1.0/24"
  availability_zone = "${var.region}a"

  tags = {
    Name = "${local.name_prefix}-private-subnet"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${local.name_prefix}-private-rt"
  }
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}

resource "aws_security_group" "ai_workload" {
  name        = "ai-workload-egress-allowlist"
  description = "Restrict AI workload outbound traffic"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "ai-workload-egress-allowlist"
  }
}

resource "aws_security_group" "bedrock_endpoint" {
  name        = "bedrock-endpoint-sg"
  description = "Allow AI workloads to reach Bedrock private endpoint"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "bedrock-endpoint-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "bedrock_endpoint_from_workload" {
  security_group_id            = aws_security_group.bedrock_endpoint.id
  referenced_security_group_id = aws_security_group.ai_workload.id
  from_port                    = 443
  to_port                      = 443
  ip_protocol                  = "tcp"
  description                  = "Allow AI workload HTTPS traffic to Bedrock endpoint"
}

resource "aws_vpc_security_group_egress_rule" "workload_to_bedrock_endpoint" {
  security_group_id            = aws_security_group.ai_workload.id
  referenced_security_group_id = aws_security_group.bedrock_endpoint.id
  from_port                    = 443
  to_port                      = 443
  ip_protocol                  = "tcp"
  description                  = "Allow AI workload egress to Bedrock endpoint only"
}

resource "aws_vpc_security_group_egress_rule" "workload_to_internal_https" {
  security_group_id = aws_security_group.ai_workload.id
  cidr_ipv4         = aws_vpc.main.cidr_block
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
  description       = "Allow AI workload HTTPS traffic to internal VPC services"
}

resource "aws_vpc_endpoint" "bedrock_runtime" {
  vpc_id              = aws_vpc.main.id
  service_name        = "com.amazonaws.${var.region}.bedrock-runtime"
  vpc_endpoint_type   = "Interface"
  subnet_ids          = [aws_subnet.private.id]
  security_group_ids  = [aws_security_group.bedrock_endpoint.id]
  private_dns_enabled = true

  tags = {
    Name = "${local.name_prefix}-bedrock-runtime-endpoint"
  }
}