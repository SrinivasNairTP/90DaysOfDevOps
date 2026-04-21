variable "vpc_cidr" {

    description = "CIDR block for the VPC"
    default     = "10.0.0.0/16"
  
}

variable "subnet_cidr" {

    description = "CIDR block for the subnet"
    default     = "10.0.1.0/24"
  
}

variable "instance_type" {

    description = "EC2 instance type"
    default     = "t3.micro"
  
}

variable "project_name" {

    description = "Give a project name"
    # default = {}
  
}

variable "environment" {

    description = "The environment to deploy to"
    default     = "prod"
  
}

variable "prefix" {
  description = "Prefix for S3 bucket name"
  type        = string
  default     = ""
}
