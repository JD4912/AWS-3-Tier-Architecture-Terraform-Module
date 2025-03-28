variable "vpc_id" {
  description = "ID of the VPC"
}

variable "db_subnet_ids" {
  description = "IDs of the database subnets"
  type        = list(string)
}

variable "db_security_group_id" {
  description = "ID of the database tier security group"
}

variable "db_instance_class" {
  description = "RDS instance class"
}

variable "db_allocated_storage" {
  description = "Allocated storage for the database (GB)"
}

variable "db_name" {
  description = "Database name"
}

variable "db_username" {
  description = "Database username"
}

variable "db_password" {
  description = "Database password"
  sensitive   = true
}

variable "project_name" {
  description = "Name of the project"
}
variable "environment" {
  
}