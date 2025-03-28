# Environment Define
environment = "dev"

aws_region          = "us-east-1"
vpc_cidr            = "172.168.0.0/16"
availability_zones  = ["us-east-1a", "us-east-1b", "us-east-1c"]
public_subnet_cidrs = ["172.168.0.0/24", "172.168.1.0/24", "172.168.2.0/24"]
app_subnet_cidrs    = ["172.168.172.0/24", "172.168.11.0/24", "172.168.12.0/24"]
db_subnet_cidrs     = ["172.168.20.0/24", "172.168.21.0/24", "172.168.22.0/24"]
project_name        = "demo"

# Instance configuration
web_instance_type = "t3.micro"
app_instance_type = "t3.small"
key_name          = "demo"
image_id          = "ami-04b4f1a9cf54c11d0"

# Auto Scaling configuration
web_min_size         = 1
web_max_size         = 2
web_desired_capacity = 2
app_min_size         = 1
app_max_size         = 2
app_desired_capacity = 2

# Database configuration
db_instance_class    = "db.t3.micro"
db_allocated_storage = 30
db_name              = "dev_db"
db_username          = "postgres"
db_password          = "postgres123" # Note: For production use secrets manager or parameter store
