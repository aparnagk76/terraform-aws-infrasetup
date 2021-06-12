module "vpc" {
  source = "./modules/vpc"

  vpc_cidr_block   = var.vpc_cidr_block
  environment_name = var.environment_name

}

module "ec2" {
  source = "./modules/ec2"

  ingress_cidr_blocks    = var.ingress_cidr_blocks
  egress_cidr_blocks     = var.egress_cidr_blocks
  instance_type          = var.instance_type
  key_name               = var.key_name
  private_key_path       = var.private_key_path
  backend_instance_count = var.backend_instance_count
  vpc_id                 = module.vpc.vpc_id
  public_subnet_id       = module.vpc.public_subnet_id
  private_subnet_id      = module.vpc.private_subnet_id
}