# Call the networking module
module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  project_name = var.project_name
  az-a = var.az-a
  az-b = var.az-b
}
module "ec2" {
  source = "./modules/ec2"
  keyname = var.keyname
  private_instance_type = var.private_instance_type
  private_instance_name = var.private_instance_name
  bastion_instance_name = var.bastion_instance_name
  bastion_instance_type = var.bastion_instance_type
  private_subnet_id = module.vpc.private_subnet_ids[0]
  public_subnet_id = module.vpc.public_subnet_ids[0]
  security_group_id = module.securitygroup.security_group_id
}
module "securitygroup" {
  source = "./modules/securitygroup"
  sg_name = var.sg_name
  vpc_id = module.vpc.vpc_id
}