#########################################
# Public Subnet 1
#########################################

resource "aws_subnet" "public_1" {

  vpc_id = aws_vpc.main.id

  cidr_block = var.public_subnet_1_cidr

  availability_zone = "ap-south-1a"

  map_public_ip_on_launch = true

  tags = merge(
    var.project_tags,
    {
      Name = "${var.project_name}-${var.environment}-public-subnet-1"
      Type = "Public"
    }
  )
}

#########################################
# Public Subnet 2
#########################################

resource "aws_subnet" "public_2" {

  vpc_id = aws_vpc.main.id

  cidr_block = var.public_subnet_2_cidr

  availability_zone = "ap-south-1b"

  map_public_ip_on_launch = true

  tags = merge(
    var.project_tags,
    {
      Name = "${var.project_name}-${var.environment}-public-subnet-2"
      Type = "Public"
    }
  )
}

#########################################
# Private Subnet 1
#########################################

resource "aws_subnet" "private_1" {

  vpc_id = aws_vpc.main.id

  cidr_block = var.private_subnet_1_cidr

  availability_zone = "ap-south-1a"

  map_public_ip_on_launch = false

  tags = merge(
    var.project_tags,
    {
      Name = "${var.project_name}-${var.environment}-private-subnet-1"
      Type = "Private"
    }
  )
}

#########################################
# Private Subnet 2
#########################################

resource "aws_subnet" "private_2" {

  vpc_id = aws_vpc.main.id

  cidr_block = var.private_subnet_2_cidr

  availability_zone = "ap-south-1b"

  map_public_ip_on_launch = false

  tags = merge(
    var.project_tags,
    {
      Name = "${var.project_name}-${var.environment}-private-subnet-2"
      Type = "Private"
    }
  )
}
