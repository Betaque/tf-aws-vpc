resource "aws_internet_gateway" "aws_igw" {
  depends_on = [aws_vpc.vpc]
  vpc_id     = aws_vpc.vpc.id

  tags = {
    Name = var.aws_internet_gateway_name
  }
}
