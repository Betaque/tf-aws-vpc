#########################################################################
# Public Subnet
#########################################################################

resource "aws_subnet" "aws_public_subnet" {
  count = length(var.aws_public_subnets)

  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.aws_public_subnets[count.index].cidr
  availability_zone       = var.aws_public_subnets[count.index].availability_zones # Change this accordingly
  map_public_ip_on_launch = true

  tags = {
    Name = var.aws_public_subnets[count.index].name
  }
}

#########################################################################
# Private Subnet
#########################################################################

resource "aws_subnet" "aws_private_subnet" {
  count = length(var.aws_private_subnets)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.aws_private_subnets[count.index].cidr
  availability_zone       = var.aws_private_subnets[count.index].availability_zones
  map_public_ip_on_launch = false

  tags = {
    Name = var.aws_private_subnets[count.index].name
  }
}
