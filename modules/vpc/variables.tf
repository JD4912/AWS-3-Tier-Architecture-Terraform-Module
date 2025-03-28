variable "vpc_cidr" {
  description = "CIDR block for the VPC"
}

variable "availability_zones" {
  description = "Availability Zones to use"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for the public subnets"
  type        = list(string)
}

variable "app_subnet_cidrs" {
  description = "CIDR blocks for the application subnets"
  type        = list(string)
}

variable "db_subnet_cidrs" {
  description = "CIDR blocks for the database subnets"
  type        = list(string)
}

variable "project_name" {
  description = "Name of the project"
}

variable "environment" {
  description = "define environment"
  
}