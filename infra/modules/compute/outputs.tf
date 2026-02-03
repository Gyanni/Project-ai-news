output "ecs_cluster_id" {
  value = var.create_ecs ? aws_ecs_cluster.this[0].id : null
}

output "ecr_repository_url" {
  value = var.create_ecr ? aws_ecr_repository.this[0].repository_url : null
}

output "app_security_group_id" {
  value = aws_security_group.app.id
}
