##########################################################################
# Public Routing table 
##########################################################################

resource "aws_route_table" "aws_public_route_table" {
  depends_on = [aws_vpc.vpc, aws_internet_gateway.aws_igw]
  vpc_id     = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.aws_igw.id
  }
  lifecycle {
    ignore_changes = all
  }

  tags = {
    Name = var.aws_public_route_table_name
  }
}

resource "aws_route_table_association" "public_route_table_association" {
  count = length(var.aws_public_subnets)
  subnet_id = element(aws_subnet.aws_public_subnet[*].id, count.index)
  route_table_id = aws_route_table.aws_public_route_table.id
}


###########################################################
## Private Routing table 
###########################################################

resource "aws_route_table" "aws_private_route_table" {
  depends_on = [aws_vpc.vpc, aws_internet_gateway.aws_igw]
  vpc_id     = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = var.aws_private_route_table_name
  }
}

resource "aws_route_table_association" "private_route_table_association" {
  count          = length(var.aws_private_subnets)
  subnet_id      = element(aws_subnet.aws_private_subnet[*].id, count.index)
  route_table_id = aws_route_table.aws_private_route_table.id
}
 
