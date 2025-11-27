# aws_region
aws_region = "us-east-1"

#VPC
vpc_cidr_block = "10.0.0.0/16"
vpc_name       = "acer_vpc_qa"

#internet_gateway
internet_gateway_name = "acer_internet_gateway_qa"

#subnets
subnet1_cidr_block = "10.0.1.0/24"
subnet1_az         = "us-east-1a"
subnet1_name       = "acer_public_subnet_1_1a_qa"

subnet2_cidr_block = "10.0.2.0/24"
subnet2_az         = "us-east-1a"
subnet2_name       = "acer_public_subnet_2_1a_qa"

subnet3_cidr_block = "10.0.3.0/24"
subnet3_az         = "us-east-1b"
subnet3_name       = "acer_public_subnet_3_1b_qa"

#route_tables
acer_public_route_table_cidr_blocks = "0.0.0.0/0"
acer_public_route_table_name        = "acer_public_route_table_qa"

#security_groups
acer_security_group_name = "acer_security_group_qa"

#ec2
ami_id         = "ami-0c398cb65a93047f2"
instance_type  = "t3.small"
key_name       = "KKey"
ec2_aws_region = "us-east-1"
ec2_name       = "demo-acer-server-qa"

#dynamodb
dynamodb_table_name = "acer_terraform_locks_qa"
billing_mode        = "PAY_PER_REQUEST"
hash_key            = "LockID"