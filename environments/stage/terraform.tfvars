# Environment Define
environment = "stage"

aws_region          = "us-east-1"
vpc_cidr            = "172.169.0.0/16"
availability_zones  = ["us-east-1a", "us-east-1b", "us-east-1c"]
public_subnet_cidrs = ["172.169.0.0/24", "172.169.1.0/24", "172.169.2.0/24"]
app_subnet_cidrs    = ["172.169.172.0/24", "172.169.11.0/24", "172.169.12.0/24"]
db_subnet_cidrs     = ["172.169.20.0/24", "172.169.21.0/24", "172.169.22.0/24"]
project_name        = "demo"

# Instance configuration
web_instance_type = "t3.small"
app_instance_type = "t3.medium"
key_name          = "demo"
image_id          = "ami-04b4f1a9cf54c11d0"

# Auto Scaling configuration
web_min_size         = 2
web_max_size         = 4
app_min_size         = 2
app_max_size         = 5

# Database configuration
db_instance_class    = "db.t3.small"
db_allocated_storage = "50"
db_name              = "dev_db"
db_username          = "postgres"
db_password          = "postgres123" # Note: For production use secrets manager or parameter store
