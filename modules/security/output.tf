output "web_security_group_id" {
  description = "ID of the web tier security group"
  value       = aws_security_group.web.id
}

output "app_security_group_id" {
  description = "ID of the application tier security group"
  value       = aws_security_group.app.id
}

output "db_security_group_id" {
  description = "ID of the database tier security group"
  value       = aws_security_group.db.id
}