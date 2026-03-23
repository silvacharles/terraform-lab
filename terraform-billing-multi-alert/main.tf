terraform {
  # Especifica a versão mínima do Terraform necessária para este projeto
  # Compativel com o Opentofu
  required_version = ">= 1.10.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.37.0"
    }
  }
  # Configuração do backend para armazenar o estado do Terraform no S3
  backend "s3" {
    bucket = "charlessilva-remote-state"
    key    = "aws-cloudwatch/terraform.tfstate"
    region = "sa-east-1"
  }
}

provider "aws" {
  alias  = "billing"
  region = "sa-east-1"
}

# SNS
resource "aws_sns_topic" "billing_alert" {
  provider = aws.billing
  name     = "billing-alert-topic"
}

resource "aws_sns_topic_subscription" "email" {
  provider  = aws.billing
  topic_arn = aws_sns_topic.billing_alert.arn
  protocol  = "email"
  endpoint  = var.email
}

# 🔔 WARNING (5 USD)
resource "aws_cloudwatch_metric_alarm" "billing_warning" {
  provider = aws.billing

  alarm_name          = "billing-warning-5usd"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  threshold           = 5
  period              = 21600
  statistic           = "Maximum"
  namespace           = "AWS/Billing"
  metric_name         = "EstimatedCharges"

  dimensions = {
    Currency = "USD"
  }

  alarm_description = "[WARNING] Custo passou de 5 USD"

  alarm_actions = [
    aws_sns_topic.billing_alert.arn
  ]
}

# 🚨 ALERTA (10 USD)
resource "aws_cloudwatch_metric_alarm" "billing_alert" {
  provider = aws.billing

  alarm_name          = "billing-alert-10usd"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  threshold           = 10
  period              = 21600
  statistic           = "Maximum"
  namespace           = "AWS/Billing"
  metric_name         = "EstimatedCharges"

  dimensions = {
    Currency = "USD"
  }

  alarm_description = "[ALERT] Custo passou de 10 USD"

  alarm_actions = [
    aws_sns_topic.billing_alert.arn
  ]
}

# 💀 PÂNICO (20 USD)
resource "aws_cloudwatch_metric_alarm" "billing_critical" {
  provider = aws.billing

  alarm_name          = "billing-critical-20usd"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  threshold           = 20
  period              = 21600
  statistic           = "Maximum"
  namespace           = "AWS/Billing"
  metric_name         = "EstimatedCharges"

  dimensions = {
    Currency = "USD"
  }

  alarm_description = "[CRITICAL] Custo passou de 20 USD"

  alarm_actions = [
    aws_sns_topic.billing_alert.arn
  ]
}