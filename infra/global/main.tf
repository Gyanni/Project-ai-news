# Global resources (shared across environments)
# e.g., IAM roles, Route53 zones, ACM certificates

terraform {
  required_version = ">= 1.0"

  backend "s3" {
    bucket         = "ainews-apnortheast2-tfstate"
    key            = "global/terraform.tfstate"
    region         = "ap-northeast-2"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-2"

  default_tags {
    tags = {
      Project   = "ainews"
      ManagedBy = "terraform"
    }
  }
}

# Example: Route53 Zone
# resource "aws_route53_zone" "main" {
#   name = "example.com"
# }

# Example: ACM Certificate
# resource "aws_acm_certificate" "main" {
#   domain_name       = "*.example.com"
#   validation_method = "DNS"
# }
