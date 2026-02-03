# ECS Cluster
resource "aws_ecs_cluster" "this" {
  count = var.create_ecs ? 1 : 0
  name  = "${var.name}-cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

# ECR Repository
resource "aws_ecr_repository" "this" {
  count                = var.create_ecr ? 1 : 0
  name                 = var.name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

# Security Group for App
resource "aws_security_group" "app" {
  name        = "${var.name}-app-sg"
  description = "Security group for application"
  vpc_id      = var.vpc_id

  ingress {
    description     = "From ALB"
    from_port       = var.app_port
    to_port         = var.app_port
    protocol        = "tcp"
    security_groups = var.alb_security_group_ids
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name}-app-sg"
  }
}
