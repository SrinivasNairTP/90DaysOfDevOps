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

data "aws_ami" "ami1" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

}



module "web_sg" {
    source   = "./modules/security-group"
    sg_name  = "web-sg"
    vpc_id   = aws_vpc.vpc1.id
    ingress_ports = [22,80, 443]
    tags     = {
        Name = "web-sg"
    }
  
}

module "web_server" {
    source            = "./modules/ec2-instance"
    ami_id            = data.aws_ami.ami1.id
    instance_type      = var.instance_type
    subnet_id          = aws_subnet.subnet1.id
    seurity_group_ids  = [module.web_sg.security_group_id]
    instance_name        = "web-server"
    tags               = {
        Name = "web-server"
    }
  
}

module "api_server" {

    source = "./modules/ec2-instance"
    ami_id = data.aws_ami.ami1.id
    instance_type = var.instance_type
    subnet_id = aws_subnet.subnet1.id
    seurity_group_ids = [module.web_sg.security_group_id]
    instance_name = "api-server"
    tags = {
        Name = "api-server"
    }
  
}