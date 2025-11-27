terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {
    bucket = "acer-demo-bucket-00001"
    key    = "acer.tfstate"
    region = "us-east-1"
    use_lockfile = true
  }
}

provider "aws" {
  region = var.aws_region
}

#Modules

#VPC
module "acer_vpc" {
  source         = "./modules/vpc"
  vpc_cidr_block = var.vpc_cidr_block
  vpc_name       = var.vpc_name
}

#internet_gateway
module "acer_internet_gateway" {
  source                = "./modules/internet_gateway"
  vpc_id                = module.acer_vpc.vpc_id
  internet_gateway_name = var.internet_gateway_name


}

#subnets
module "acer_subnets" {
  source = "./modules/subnets"
  vpc_id = module.acer_vpc.vpc_id

  subnet1_cidr_block = var.subnet1_cidr_block
  subnet1_az         = var.subnet1_az
  subnet1_name       = var.subnet1_name

  subnet2_cidr_block = var.subnet2_cidr_block
  subnet2_az         = var.subnet2_az
  subnet2_name       = var.subnet2_name

  subnet3_cidr_block = var.subnet3_cidr_block
  subnet3_az         = var.subnet3_az
  subnet3_name       = var.subnet3_name
}


#route_tables
module "acer_route_tables" {
  source              = "./modules/route_tables"
  vpc_id              = module.acer_vpc.vpc_id
  internet_gateway_id = module.acer_internet_gateway.internet_gateway_id

  acer_public_route_table_cidr_blocks = var.acer_public_route_table_cidr_blocks
  acer_public_route_table_name        = var.acer_public_route_table_name
}


#route_table_associations
module "acer_route_table_associations" {
  source = "./modules/route_table_associations"

  subnet1_id = module.acer_subnets.subnet1_id
  subnet2_id = module.acer_subnets.subnet2_id
  subnet3_id = module.acer_subnets.subnet3_id

  acer_public_route_table_id = module.acer_route_tables.acer_public_route_table_id
}


#security_groups
module "acer_security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.acer_vpc.vpc_id

  acer_security_group_name = var.acer_security_group_name
}

#ec2
module "acer_ec2" {
  source         = "./modules/ec2"
  ami_id         = var.ami_id
  instance_type  = var.instance_type
  key_name       = var.key_name
  ec2_aws_region = var.ec2_aws_region
  ec2_name       = var.ec2_name

  subnet1_id             = module.acer_subnets.subnet1_id
  acer_security_group_id = module.acer_security_groups.acer_security_group_id
}

#dynamodb
module "acer_dynamodb" {
  source = "./modules/dynamodb"
  dynamodb_table_name = var.dynamodb_table_name
  billing_mode        = var.billing_mode
  hash_key            = var.hash_key
}