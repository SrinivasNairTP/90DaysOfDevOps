module "vpc" {
  source = "./modules/vpc"

  cidr               = var.cidr
  public_subnet_cidr = var.public_subnet_cidr
  environment        = local.environment
  project_name       = local.name_prefix  
  tags               = local.common_tags
}

module "sg" {
  source = "./modules/security-group"

  vpc_id        = module.vpc.vpc_id
  ingress_ports = var.ingress_ports
  environment   = local.environment
  project_name  = local.name_prefix
  tags            = local.common_tags
}

module "ec2" {
  source = "./modules/ec2-instance"

  ami_id             = var.ami_id
  instance_type      = var.instance_type
  subnet_id          = module.vpc.subnet_id
  security_group_ids = [module.sg.sg_id]
  environment        = local.environment
  project_name       = local.name_prefix
  tags               = local.common_tags
}