resource "aws_launch_template" "web" {
  name_prefix   = "${var.environment}-${var.project_name}-web-"
  image_id      = var.image_id
  instance_type = var.instance_type
  key_name      = var.key_name
  
  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [var.web_security_group_id]
  }
  
  user_data = base64encode(<<-EOF
    #!/bin/bash
    apt update -y
    apt install -y nginx
    systemctl start nginx
    systemctl enable nginx
    echo "<h1>Welcome to the Web Tier</h1>" > /var/www/html/index.html
    EOF
  )
  
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "${var.environment}-${var.project_name}-web-instance"
    }
  }
}

resource "aws_autoscaling_group" "web" {
  name                = "${var.project_name}-web-asg"
  vpc_zone_identifier = var.public_subnet_ids
  min_size            = var.min_size
  max_size            = var.max_size
  desired_capacity    = var.desired_capacity
  
  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }
  
  target_group_arns = [var.web_alb_target_group_arn]
  
  tag {
    key                 = "Name"
    value               = "${var.project_name}-web-asg"
    propagate_at_launch = true
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
  
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}