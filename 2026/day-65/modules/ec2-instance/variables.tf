variable "ami_id" {
    description = "The ID of the AMI to use for the EC2 instance."
    type        = string
  
}

variable "instance_type" {
    description = "The type of the EC2 instance (e.g., t2.micro)."
    type        = string
    default     = "t2.micro"
}

variable "instance_name" {
    description = "The name to assign to the EC2 instance."
    type        = string
  
}

variable "subnet_id" {
    description = "The ID of the subnet to launch the EC2 instance in."
    type        = string
}

variable "seurity_group_ids" {
    description = "A list of security group IDs to associate with the EC2 instance."
    type        = list(string)
  
}

variable "tags" {
    description = "A map of tags to assign to the EC2 instance."
    type        = map(string)
    default     = {}
}