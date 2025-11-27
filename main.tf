# Modules
module "ec2" {
  source        = "./modules/ec2"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  ec2_region    = var.ec2_region
  ec2_name      = var.ec2_name
}
