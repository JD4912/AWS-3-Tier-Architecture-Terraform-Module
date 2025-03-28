variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "Availability Zones to use"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for the public subnets"
  type        = list(string)
  default     = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
}

variable "app_subnet_cidrs" {
  description = "CIDR blocks for the application subnets"
  type        = list(string)
  default     = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]
}

variable "db_subnet_cidrs" {
  description = "CIDR blocks for the database subnets"
  type        = list(string)
  default     = ["10.0.20.0/24", "10.0.21.0/24", "10.0.22.0/24"]
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "three-tier"
}

variable "instance_types" {
  description = "EC2 instance types for each environment"
  type = map(string)
  default = {
    "dev"     = "t2.micro"
    "staging" = "t2.medium"
    "prod"    = "t3.large"
  }
}

variable "instance_counts" {
  description = "The instance count for each tier in each environment"
  type = map(map(number))
  default = {
    "dev" = {
      "web" = 1
      "app" = 1
      "db"  = 1
    },
    "staging" = {
      "web" = 2
      "app" = 2
      "db"  = 1
    },
    "prod" = {
      "web" = 3
      "app" = 3
      "db"  = 1
    },
  }
}

variable "web_instance_type" {
  description = "Instance type for web servers"
  type        = string
  default     = "t3.micro"
}

variable "app_instance_type" {
  description = "Instance type for application servers"
  type        = string
  default     = "t3.small"
}

variable "key_name" {
  description = "SSH key name to use for EC2 instances"
  type        = string
  default     = "my-key-pair"
}

variable "web_min_size" {
  description = "Minimum number of web instances"
  type        = number
  default     = 2
}

variable "web_max_size" {
  description = "Maximum number of web instances"
  type        = number
  default     = 6
}

variable "web_desired_capacity" {
  description = "Desired number of web instances"
  type        = number
  default     = 2
}

variable "app_min_size" {
  description = "Minimum number of app instances"
  type        = number
  default     = 2
}

variable "app_max_size" {
  description = "Maximum number of app instances"
  type        = number
  default     = 6
}

variable "app_desired_capacity" {
  description = "Desired number of app instances"
  type        = number
  default     = 2
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.small"
}

variable "db_allocated_storage" {
  description = "Allocated storage for the database (GB)"
  type        = number
  default     = 20
}

variable "db_name" {
  description = "Database name"
  type        = string
  default     = "appdb"
}

variable "db_username" {
  description = "Database username"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "environment" {
  description = "Deployment environment (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "enable_enhanced_monitoring" {
  description = "Enable enhanced monitoring for RDS"
  type        = bool
  default     = false
}

variable "backup_retention_period" {
  description = "RDS backup retention period in days"
  type        = number
  default     = 7
}

variable "enable_multi_az" {
  description = "Enable Multi-AZ deployment for RDS"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Additional tags for resources"
  type        = map(string)
  default     = {}
}

variable "image_id" {
  description = "Name of the priject"

}