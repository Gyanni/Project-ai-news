variable "name" {
  description = "Name prefix for resources"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "app_port" {
  description = "Application port"
  type        = number
  default     = 8080
}

variable "alb_security_group_ids" {
  description = "ALB security group IDs"
  type        = list(string)
  default     = []
}

variable "create_ecs" {
  description = "Create ECS cluster"
  type        = bool
  default     = false
}

variable "create_ecr" {
  description = "Create ECR repository"
  type        = bool
  default     = false
}
