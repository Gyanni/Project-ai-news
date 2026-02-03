output "nat_gateway_id" {
  value = var.enable_nat ? aws_nat_gateway.this[0].id : null
}

output "public_route_table_id" {
  value = aws_route_table.public.id
}

output "private_route_table_id" {
  value = aws_route_table.private.id
}
