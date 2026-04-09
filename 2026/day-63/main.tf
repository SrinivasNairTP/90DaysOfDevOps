resource "aws_vpc" "vpc1" {
  cidr_block = var.vpc_cidr
  # tags = {
  #   name = "${local.name_prefix}-VPC"
  # }
  tags = merge(local.tags, {
    Name = "${local.name_prefix}-VPC"
  })

}

resource "aws_subnet" "subnet1" {
  cidr_block              = var.subnet_cidr
  vpc_id                  = aws_vpc.vpc1.id
  availability_zone = data.aws_availability_zones.zone.names[0]
  map_public_ip_on_launch = true
  # tags = {
  #   name = "${local.name_prefix}-Public-Subnet"
  # }
  tags = merge(local.tags, {
    Name = "${local.name_prefix}-Public-Subnet"
  })

}

resource "aws_internet_gateway" "igw1" {
  vpc_id = aws_vpc.vpc1.id
}

resource "aws_route_table" "route_table1" {
  vpc_id = aws_vpc.vpc1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw1.id
  }
}

resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.route_table1.id
}

resource "aws_security_group" "sg1" {

  name        = "terraweek-sg"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.vpc1.id

  tags = {
    Name = "terraweek-sg"
  }

  # SSH access
  ingress {
    from_port   = var.allowed_ports[0]
    to_port     = var.allowed_ports[0]
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP access
  ingress {
    from_port   = var.allowed_ports[1]
    to_port     = var.allowed_ports[1]
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "tws_instance" {

  ami                         = data.aws_ami.ami1.id
  # instance_type               = var.instance_type
  instance_type = var.environment == "prod" ? "t3.small" :"t3.micro"
  subnet_id                   = aws_subnet.subnet1.id
  vpc_security_group_ids      = [aws_security_group.sg1.id]
  associate_public_ip_address = true
  # tags = {
  #   name = "${local.name_prefix}-Server"
  # }

  
  tags = merge(local.tags, {
    Name = "${local.name_prefix}-Server"
  })
  lifecycle {
    create_before_destroy = true
  }

}

resource "aws_s3_bucket" "bucket1" {
  bucket     = "terraweek-bucket-2027"
  depends_on = [aws_instance.tws_instance]
  tags = {
    name = "TerraWeek-Bucketnew"
  }
}

data "aws_ami" "ami1" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  
}

data "aws_availability_zones" "zone" {
  
  state = "available"

}

locals {
  
name_prefix= "${var.project_name}-${var.environment}"

tags = {
  Project     = var.project_name
  Environment = var.environment
  managed_by  = "Terraform"

}
}