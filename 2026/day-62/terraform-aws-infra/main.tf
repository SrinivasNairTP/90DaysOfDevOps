resource "aws_vpc" "vpc1" {
    cidr_block = "10.0.0.0/16"
    tags = {
       name = "TerraWeek-VPC"
    }
}

resource "aws_subnet" "subnet1" {
    cidr_block = "10.0.1.0/24"
    vpc_id = aws_vpc.vpc1.id
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
    subnet_id = aws_subnet.subnet1.id
    route_table_id = aws_route_table.route_table1.id
}