variable "vpc_name" {
  description = "The name for the VPC."
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC. This defines the IP address range for the entire VPC."
  type        = string
}

variable "aws_nat_gateway_name" {
  description = "The name for the NAT Gateway."
  type        = string
}

variable "aws_internet_gateway_name" {
  description = "The name for the Internet Gateway (IGW)."
  type        = string
}

variable "aws_public_route_table_name" {
  description = "The name for the public subnet route table."
  type        = string
}

variable "aws_private_route_table_name" {
  description = "The name for the private subnet route table."
  type        = string
}

variable "aws_public_subnets" {
  description = "List of subnets with names, availability-zones and CIDR blocks"
  type        = list(object({
    name      = string
    cidr      = string
    availability_zones = string
  }))
}

variable "aws_private_subnets" {
  description = "List of subnets with names, availability-zones and CIDR blocks"
  type        = list(object({
    name      = string
    cidr      = string
    availability_zones = string
  }))
}
