output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_subnet_id" {
  value = aws_subnet.aws_public_subnet.*.id
}

output "private_subnet_id" {
  value = aws_subnet.aws_private_subnet.*.id
}

