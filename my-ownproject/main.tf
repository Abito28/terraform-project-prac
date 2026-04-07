module "my_vpc" {
  source = "./modules/vpc"
}

module "my_ec2" {
  source    = "./modules/ec2"
  vpc_id    = module.my_vpc.vpc_id
  vpc_name  = module.my_vpc.vpc_name
  subnet_id = module.my_vpc.public_subnet_id
}

module "my_rds" {
  source         = "./modules/RDS"
  rds_subnet_ids = module.my_vpc.private_subnet_ids
}