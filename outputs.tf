output "vpc_id" {
  description = "ID of the created VPC."
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "Map of public subnet IDs, keyed by subnet suffix (a, b, c)."
  value       = { for k, s in aws_subnet.public : k => s.id }
}

output "internet_gateway_id" {
  description = "ID of the Internet Gateway attached to the VPC."
  value       = aws_internet_gateway.main.id
}

output "route_table_id" {
  description = "ID of the public route table."
  value       = aws_route_table.public.id
}