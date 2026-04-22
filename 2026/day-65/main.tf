# resource "aws_vpc" "vpc1" {
#   cidr_block = "10.0.0.0/16"
#   tags = {
#     name = "TerraWeek-VPC"
#   }
# }

module "vpc" {

    source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = "terraweek-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-2a", "us-east-2b", "us-east-2c"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
#   private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]

  enable_nat_gateway = false
  enable_dns_hostnames = true

  tags = {
    name = "terraweek-vpc"
  }
}

# resource "aws_subnet" "subnet1" {
#   cidr_block              = "10.0.1.0/24"
#   vpc_id                  = aws_vpc.vpc1.id
#   map_public_ip_on_launch = true
#   tags = {
#     name = "TerraWeek-Public-Subnet"
#   }

# }

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
    vpc_id   = module.vpc.vpc_id
    ingress_ports = [22,80, 443]
    tags     = {
        Name = "web-sg"
    }
  
}

module "web_server" {
    source            = "./modules/ec2-instance"
    ami_id            = data.aws_ami.ami1.id
    instance_type      = var.instance_type
    subnet_id          = module.vpc.public_subnets[0]
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
    subnet_id = module.vpc.public_subnets[0]
    seurity_group_ids = [module.web_sg.security_group_id]
    instance_name = "api-server"
    tags = {
        Name = "api-server"
    }
  
}