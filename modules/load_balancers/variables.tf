variable "vpc_id" {
  description = "ID of the VPC"
}

variable "public_subnet_ids" {
  description = "IDs of the public subnets"
  type        = list(string)
}

variable "web_security_group_id" {
  description = "ID of the web tier security group"
}

variable "app_security_group_id" {
  description = "ID of the application tier security group"
}

variable "project_name" {
  description = "Name of the project"
}

variable "environment" {
  
}