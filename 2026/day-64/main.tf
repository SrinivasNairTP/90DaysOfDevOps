resource "aws_vpc" "vpc" {

    cidr_block = var.vpc_cidr
    
    tags = {
        Name = "${local.name_prefix}-VPC"
    }
  
}

resource "aws_subnet" "subnet1" {
  cidr_block              = var.subnet_cidr
  vpc_id                  = aws_vpc.vpc.id
  map_public_ip_on_launch = true
    tags = {
        Name = "${local.name_prefix}-Public-Subnet"
    }
}

resource "aws_security_group" "sg" {

    name        = "${local.name_prefix}-SG"
    description = "Allow SSH and HTTP"
    vpc_id      = aws_vpc.vpc.id
    
    tags = {
        Name = "${local.name_prefix}-SG"
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

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

}

resource "aws_instance" "instance_name" {

    ami                         = data.aws_ami.name.id
    instance_type               = var.instance_type
    subnet_id                   = aws_subnet.subnet1.id
    vpc_security_group_ids      = [aws_security_group.sg.id]
    
    tags = {
        Name = "${local.name_prefix}-Instance"
    }
  
}


data "aws_ami" "name" {

    most_recent = true
    owners = ["amazon"]
    filter {
        name   = "name"
        values = ["amzn2-ami-hvm-*-x86_64-gp2"]
    }
  
}


locals {
  
  name_prefix = "${var.project_name}-${var.environment}"
  
  tags = {
    Project     = var.project_name
    Environment = var.environment
  }

}

# resource "aws_s3_bucket" "logs_bucket" {
  
# }

# resource "aws_s3_bucket" "bucketnew" {
#     bucket = "${var.prefix != "" ? var.prefix : "default"}-test-bucket"
    
#     tags = {
#         Name = "${local.name_prefix}-Buckettest"
#     }
  
# }