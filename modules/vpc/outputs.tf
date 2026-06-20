output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_ids" {
  value = { for k, v in aws_subnet.main : k => v.id if v.tags["type"] == "public" }
}

output "private_subnet_ids" {
  value = { for k, v in aws_subnet.main : k => v.id if v.tags["type"] == "private" }
}

output "vpc_name" {
  value = var.vpc_name
}