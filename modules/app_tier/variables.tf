variable "vpc_id" {
  description = "ID of the VPC"
}

variable "app_security_group_id" {
  description = "ID of the application tier security group"
}

variable "app_subnet_ids" {
  description = "IDs of the application subnets"
  type        = list(string)
}

variable "app_alb_target_group_arn" {
  description = "ARN of the app ALB target group"
}

variable "instance_type" {
  description = "Instance type for application servers"
}

variable "key_name" {
  description = "SSH key name to use for EC2 instances"
}

variable "min_size" {
  description = "Minimum number of application instances"
}

variable "max_size" {
  description = "Maximum number of application instances"
}

variable "desired_capacity" {
  description = "Desired number of application instances"
}

variable "project_name" {
  description = "Name of the project"
}

variable "image_id" {
  description = "Name of the project"
}
variable "environment" {
  
}