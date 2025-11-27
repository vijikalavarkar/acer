# AWS Region
variable "aws_region" {}

#VPC
variable "vpc_cidr_block" {}
variable "vpc_name" {}

#internet_gateway
variable "internet_gateway_name" {}

#subnets
variable "subnet1_cidr_block" {}
variable "subnet1_az" {}
variable "subnet1_name" {}

variable "subnet2_cidr_block" {}
variable "subnet2_az" {}
variable "subnet2_name" {}

variable "subnet3_cidr_block" {}
variable "subnet3_az" {}
variable "subnet3_name" {}

#route_tables
variable "acer_public_route_table_cidr_blocks" {}
variable "acer_public_route_table_name" {}
variable "acer_security_group_name" {}

#ec2
variable "ami_id" {}
variable "instance_type" {}
variable "key_name" {}
variable "ec2_aws_region" {}
variable "ec2_name" {}

#dynamodb
variable "dynamodb_table_name" {}
variable "billing_mode" {}
variable "hash_key" {}
