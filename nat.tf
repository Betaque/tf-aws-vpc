resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.aws_elastic_ip.id
  subnet_id     = aws_subnet.aws_public_subnet[0].id

  tags = {
    Name = var.aws_nat_gateway_name
  }
}
