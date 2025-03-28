

module "vpc" {
  source              = "../../modules/vpc"
  vpc_cidr            = var.vpc_cidr
  environment         = var.environment
  availability_zones  = var.availability_zones
  public_subnet_cidrs = var.public_subnet_cidrs
  app_subnet_cidrs    = var.app_subnet_cidrs
  db_subnet_cidrs     = var.db_subnet_cidrs
  project_name        = var.project_name
}

module "security_groups" {
  source       = "../../modules/security"
  environment  = var.environment
  vpc_id       = module.vpc.vpc_id
  vpc_cidr     = var.vpc_cidr
  project_name = var.project_name
}

module "load_balancers" {
  source                = "../../modules/load_balancers"
  environment           = var.environment
  vpc_id                = module.vpc.vpc_id
  public_subnet_ids     = module.vpc.public_subnet_ids
  web_security_group_id = module.security_groups.web_security_group_id
  app_security_group_id = module.security_groups.app_security_group_id
  project_name          = var.project_name
}

module "web_tier" {
  source                   = "../../modules/web_tier"
  environment              = var.environment
  vpc_id                   = module.vpc.vpc_id
  web_security_group_id    = module.security_groups.web_security_group_id
  public_subnet_ids        = module.vpc.public_subnet_ids
  web_alb_target_group_arn = module.load_balancers.web_target_group_arn
  instance_type            = var.web_instance_type
  image_id                 = var.image_id
  key_name                 = var.key_name
  min_size                 = var.web_min_size
  max_size                 = var.web_max_size
  desired_capacity         = var.web_desired_capacity
  project_name             = var.project_name
}

module "app_tier" {
  source                   = "../../modules/app_tier"
  environment              = var.environment
  vpc_id                   = module.vpc.vpc_id
  app_security_group_id    = module.security_groups.app_security_group_id
  app_subnet_ids           = module.vpc.app_subnet_ids
  app_alb_target_group_arn = module.load_balancers.app_target_group_arn
  instance_type            = var.app_instance_type
  key_name                 = var.key_name
  image_id                 = var.image_id
  min_size                 = var.app_min_size
  max_size                 = var.app_max_size
  desired_capacity         = var.app_desired_capacity
  project_name             = var.project_name
}

module "db_tier" {
  source               = "../../modules/db_tier"
  environment          = var.environment
  vpc_id               = module.vpc.vpc_id
  db_subnet_ids        = module.vpc.db_subnet_ids
  db_security_group_id = module.security_groups.db_security_group_id
  db_instance_class    = var.db_instance_class
  db_allocated_storage = var.db_allocated_storage
  db_name              = var.db_name
  db_username          = var.db_username
  db_password          = var.db_password
  project_name         = var.project_name
}