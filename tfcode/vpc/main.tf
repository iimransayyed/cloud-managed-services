# Create VPC from module
# Change environment name, CIDR blocks and additional tags as needed
module "vpc_staging" {
  source = "../modules/vpc/"

  environment_name         = var.environment_name
  vpc_cidr                 = var.vpc_cidr
  public_subnet_cidr_az_a  = var.public_subnet_cidr_az_a
  public_subnet_cidr_az_b  = var.public_subnet_cidr_az_b
  public_subnet_cidr_az_c  = var.public_subnet_cidr_az_c
  private_subnet_cidr_az_a = var.private_subnet_cidr_az_a
  private_subnet_cidr_az_b = var.private_subnet_cidr_az_b
  private_subnet_cidr_az_c = var.private_subnet_cidr_az_c
  additional_tags = var.additional_tags
}
module "sec-group" {
  source = "../modules/sec-groups/"

  vpc_id = module.vpc_staging.vpc_id
  
}