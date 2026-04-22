resource "aws_instance" "instance_name" {
    ami                    = var.ami_id
    instance_type          = var.instance_type
    subnet_id              = var.subnet_id
    vpc_security_group_ids = var.seurity_group_ids
    tags                   = var.tags
    associate_public_ip_address = true
  
}