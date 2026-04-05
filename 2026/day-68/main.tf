# -------------------------------
# Provider
# -------------------------------
provider "aws" {
  region = "us-east-2"   # ✅ Ensure this matches your AMI
}

# -------------------------------
# VPC
# -------------------------------
resource "aws_vpc" "vpc1" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "ansible_worker_vpc"
  }
}

# -------------------------------
# Subnet (Public)
# -------------------------------
resource "aws_subnet" "subnet1" {
  cidr_block              = "10.0.1.0/24"
  vpc_id                  = aws_vpc.vpc1.id
  availability_zone       = "us-east-2a"   # ✅ FIXED
  map_public_ip_on_launch = true

  tags = {
    Name = "ansible_worker_subnet"
  }
}

# -------------------------------
# Internet Gateway
# -------------------------------
resource "aws_internet_gateway" "igw1" {
  vpc_id = aws_vpc.vpc1.id
}

# -------------------------------
# Route Table
# -------------------------------
resource "aws_route_table" "route_table1" {
  vpc_id = aws_vpc.vpc1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw1.id
  }
}

# -------------------------------
# Route Table Association
# -------------------------------
resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.route_table1.id
}

# -------------------------------
# Security Group
# -------------------------------
resource "aws_security_group" "secgrp1" {
  name        = "ansible_worker_sg"
  description = "Allow SSH"
  vpc_id      = aws_vpc.vpc1.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]   # ⚠️ For learning only
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ansible_worker_sg"
  }
}

# -------------------------------
# SSH Key Generation
# -------------------------------
resource "tls_private_key" "pk1" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "ansible_worker_key"
  public_key = tls_private_key.pk1.public_key_openssh
}

resource "local_file" "private_key_file" {
  content  = tls_private_key.pk1.private_key_pem
  filename = "${path.module}/ansible_worker_key.pem"
}

# -------------------------------
# EC2 Instances
# -------------------------------
resource "aws_instance" "aws_worker_node" {
  count                       = 3
  ami                         = "ami-07062e2a343acc423"  # ✅ Ensure region match
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.subnet1.id
  vpc_security_group_ids      = [aws_security_group.secgrp1.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.generated_key.key_name

  tags = {
    Name = "worker-${count.index}"
  }
}