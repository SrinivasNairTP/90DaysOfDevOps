resource "aws_vpc" "vpc" {
  cidr_block = var.cidr

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-vpc"
    }
  )
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public_subnet_cidr

  map_public_ip_on_launch = true

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-public-subnet"
    }
  )
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = merge(
    var.tags,
    {
      Name        = "${var.project_name}-igw"
      Environment = var.environment
      Project     = var.project_name
    }
  )
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id

  tags = merge(
    var.tags,
    {
      Name        = "${var.project_name}-rt"
      Environment = var.environment
      Project     = var.project_name
    }
  )
}

resource "aws_route" "default" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}