resource "aws_eip" "aws_elastic_ip" {
  tags = {
    Name = "${var.aws_nat_gateway_name}-elastic-ip"
  }
}

