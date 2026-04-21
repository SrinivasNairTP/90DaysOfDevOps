variable "vpc_id" {
    description = "The ID of the VPC where the security group will be created"
    type        = string
  
}

variable "sg_name" {
    description = "The name of the security group"
    type        = string
}

variable "ingress_ports" {
    description = "values for ingress ports to allow (e.g., [22, 80])"
    type=list(number)
  
}

variable "tags" {
    description = "A list of tags to associate with the security group"
    type        = map(string)
  
}