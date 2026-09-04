module "my_vpc" {
  source = "./modules/vpc"
}

module "my_ec2" {
  source    = "./modules/ec2"
  vpc_id    = module.my_vpc.vpc_id
  vpc_name  = module.my_vpc.vpc_name
  subnet_id = module.my_vpc.public_subnet_ids["public"]
  # alb_subnets = [module.my_vpc.public_subnet_ids["public"],
  # module.my_vpc.public_subnet_ids["public-2"]] 
}

module "my_rds" {
  source         = "./modules/RDS"
  vpc_id         = module.my_vpc.vpc_id
  rds_subnet_ids = values(module.my_vpc.private_subnet_ids)
  ec2_sg_id      = module.my_ec2.security_group_id
  rds_name       = "my-mysql"
  rds_password   = "secure-password-here"
}
