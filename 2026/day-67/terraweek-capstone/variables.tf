variable "cidr" {
  description = "VPC CIDR block"
  type        = string
}

variable "public_subnet_cidr" {
  description = "Public subnet CIDR"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "ingress_ports" {
  description = "List of ingress ports"
  type        = list(number)
}

variable "ami_id" {
  description = "AMI ID for EC2"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}