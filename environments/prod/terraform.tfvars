# Environment Define
environment = "Dev"

aws_region          = "us-east-1"
vpc_cidr            = "172.170.0.0/16"
availability_zones  = ["us-east-1a", "us-east-1b", "us-east-1c"]
public_subnet_cidrs = ["172.170.0.0/24", "172.170.1.0/24", "172.170.2.0/24"]
app_subnet_cidrs    = ["172.170.172.0/24", "172.170.11.0/24", "172.170.12.0/24"]
db_subnet_cidrs     = ["172.170.20.0/24", "172.170.21.0/24", "172.170.22.0/24"]
project_name        = "demo"

# Instance configuration
web_instance_type = "t3.medium"
app_instance_type = "t3.large"
key_name          = "demo"
image_id          = "ami-04b4f1a9cf54c11d0"

# Auto Scaling configuration
web_min_size         = 3
web_max_size         = 6
app_min_size         = 3
app_max_size         = 6


# Database configuration
db_instance_class    = "db.t3.medium"
db_allocated_storage = "100"
db_name              = "dev_db"
db_username          = "postgres"
db_password          = "postgres123" # Note: For production use secrets manager or parameter store
