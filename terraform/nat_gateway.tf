#################################################
# Elastic IP for NAT Gateway
#################################################

resource "aws_eip" "nat" {

  domain = "vpc"

  tags = merge(
    var.project_tags,
    {
      Name = "${var.project_name}-${var.environment}-nat-eip"
    }
  )
}

#################################################
# NAT Gateway
#################################################

resource "aws_nat_gateway" "main" {

  allocation_id = aws_eip.nat.id

  subnet_id = aws_subnet.public_1.id

  tags = merge(
    var.project_tags,
    {
      Name = "${var.project_name}-${var.environment}-nat-gateway"
    }
  )

  depends_on = [
    aws_internet_gateway.main
  ]
}

#################################################
# Private Route to NAT Gateway
#################################################

resource "aws_route" "private_nat" {

  route_table_id = aws_route_table.private.id

  destination_cidr_block = "0.0.0.0/0"

  nat_gateway_id = aws_nat_gateway.main.id
}
