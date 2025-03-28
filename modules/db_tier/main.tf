resource "aws_db_instance" "db" {
  identifier             = "${var.project_name}-db"
  allocated_storage      = var.db_allocated_storage
  engine                 = "postgres"
  engine_version         = "13.20"
  instance_class         = var.db_instance_class
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  parameter_group_name   = "default.postgres13"
  skip_final_snapshot    = true
  vpc_security_group_ids = [var.db_security_group_id]
  db_subnet_group_name   = "${var.project_name}-db-subnet-group"
  multi_az               = true

  tags = {
    Name = "${var.environment}-${var.project_name}-db"
  }
}
