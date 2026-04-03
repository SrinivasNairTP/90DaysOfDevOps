resource "aws_vpc" "vpc1" {
  cidr_block = "10.0.0.0/16"
  tags = {
    name = "TerraWeek-VPC"
  }
}

resource "aws_subnet" "subnet1" {
  cidr_block              = "10.0.1.0/24"
  vpc_id                  = aws_vpc.vpc1.id
  map_public_ip_on_launch = true
  tags = {
    name = "TerraWeek-Public-Subnet"
  }

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
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP access
  ingress {
    from_port   = 80
    to_port     = 80
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

  ami                         = "ami-02f986bab3de34d0d" 
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.subnet1.id
  vpc_security_group_ids      = [aws_security_group.sg1.id]
  associate_public_ip_address = true
  tags = {
    name = "TerraWeek-Server"
  }

  lifecycle {
    create_before_destroy = true
  }

}

resource "aws_s3_bucket" "bucket1" {
  bucket     = "terraweek-bucket-2026"
  depends_on = [aws_instance.tws_instance]
  tags = {
    name = "TerraWeek-Bucket"
  }
}

  