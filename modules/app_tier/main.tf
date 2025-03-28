resource "aws_launch_template" "app" {
  name_prefix   = "${var.environment}-${var.project_name}-app-"
  image_id      = var.image_id
  instance_type = var.instance_type
  key_name      = var.key_name
  
  network_interfaces {
    security_groups = [var.app_security_group_id]
  }
  
  user_data = base64encode(<<-EOF
  #!/bin/bash

# Variables
TOMCAT_VERSION=10.1.39
TOMCAT_USER=tomcat
INSTALL_DIR=/opt/tomcat
SERVICE_FILE=/etc/systemd/system/tomcat.service

# Update package index
sudo apt update

# Install OpenJDK 17
sudo apt install -y openjdk-17-jdk

# Verify Java installation
java -version

# Create a dedicated Tomcat user
sudo useradd -m -U -d $INSTALL_DIR -s /bin/false $TOMCAT_USER

# Download and extract Tomcat
wget https://dlcdn.apache.org/tomcat/tomcat-10/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz -P /tmp
sudo mkdir -p $INSTALL_DIR
sudo tar -xf /tmp/apache-tomcat-$TOMCAT_VERSION.tar.gz -C $INSTALL_DIR --strip-components=1
sudo rm /tmp/apache-tomcat-$TOMCAT_VERSION.tar.gz

# Set permissions
sudo chown -R $TOMCAT_USER:$TOMCAT_USER $INSTALL_DIR
sudo chmod +x $INSTALL_DIR/bin/*.sh

# Create systemd service file
sudo bash -c "cat > $SERVICE_FILE << EOF
[Unit]
Description=Apache Tomcat Web Application Container
After=network.target

[Service]
Type=forking

User=$TOMCAT_USER
Group=$TOMCAT_USER

Environment=\"JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))\"
Environment=\"CATALINA_PID=$INSTALL_DIR/temp/tomcat.pid\"
Environment=\"CATALINA_HOME=$INSTALL_DIR\"
Environment=\"CATALINA_BASE=$INSTALL_DIR\"

ExecStart=$INSTALL_DIR/bin/startup.sh
ExecStop=$INSTALL_DIR/bin/shutdown.sh

[Install]
WantedBy=multi-user.target
EOF"

# Reload systemd and start Tomcat
sudo systemctl daemon-reload
sudo systemctl start tomcat
sudo systemctl enable tomcat

# Confirm that Tomcat is running
sudo systemctl status tomcat
EOF
)
  
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "${var.environment}-${var.project_name}-app-instance"
    }
  }
}

resource "aws_autoscaling_group" "app" {
  name                = "${var.project_name}-app-asg"
  vpc_zone_identifier = var.app_subnet_ids
  min_size            = var.min_size
  max_size            = var.max_size
  desired_capacity    = var.desired_capacity
  
  launch_template {
    id      = aws_launch_template.app.id
    version = "$Latest"
  }
  
  target_group_arns = [var.app_alb_target_group_arn]
  
  tag {
    key                 = "Name"
    value               = "${var.environment}-${var.project_name}-app-asg"
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