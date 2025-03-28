variable "vpc_id" {
  description = "ID of the VPC"
}

variable "web_security_group_id" {
  description = "ID of the web tier security group"
}

variable "public_subnet_ids" {
  description = "IDs of the public subnets"
  type        = list(string)
}

variable "web_alb_target_group_arn" {
  description = "ARN of the web ALB target group"
}

variable "instance_type" {
  description = "Instance type for web servers"
}

variable "key_name" {
  description = "SSH key name to use for EC2 instances"
}

variable "min_size" {
  description = "Minimum number of web instances"
}

variable "max_size" {
  description = "Maximum number of web instances"
}

variable "desired_capacity" {
  description = "Desired number of web instances"
}

variable "project_name" {
  description = "Name of the project"
}

variable "image_id" {
    description = "Name of the priject"
  
}

variable "environment" {
  
}