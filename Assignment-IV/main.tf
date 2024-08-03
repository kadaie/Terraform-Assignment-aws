module "vpc" {
  source             = "./modules/vpc"
  public_subnet_name = var.public_subnet_name
  igw_name           = var.igw_name
  rtb_name           = var.rtb_name
  cidr_block         = var.cidr_block
  public_subnet_cidr = var.public_subnet_cidr
}
module "securitygroup" {
  source  = "./modules/securitygroup"
  vpc_id  = module.vpc.vpc_id
  sg_name = var.sg_name
}
module "ec2" {
  source           = "./modules/ec2"
  instance_type    = var.instance_type
  public_subnet_id = module.vpc.public_subnet_id
  security_group   = module.securitygroup.security_group
}