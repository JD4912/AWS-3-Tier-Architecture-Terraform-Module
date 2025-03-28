output "web_alb_dns_name" {
  description = "DNS name of the web ALB"
  value       = module.load_balancers.web_alb_dns_name
}

output "db_endpoint" {
  description = "Endpoint of the RDS instance"
  value       = module.db_tier.db_endpoint
  sensitive   = true
}