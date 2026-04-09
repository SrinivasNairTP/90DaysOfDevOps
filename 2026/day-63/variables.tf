variable "region" {
  description = "The AWS region to create resources in"
  default     = "us-east-2"

}

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
  default     = "t2.micro"

}

variable "project_name" {
  description = "Give a project name"
  # default = {}
}

variable "environment" {
  description = "The environment to deploy to"
  default     = "prod"
}

variable "allowed_ports" {
  description = "List of allowed ports"
  type        = list(number)
  default     = [22, 80, 443]
}

variable "extra_tags" {
  description = "Additional tags to apply to resources"
  type        = map(string)
  default     = {}

}