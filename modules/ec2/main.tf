resource "aws_instance" "demo-acer-server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id = var.subnet1_id
  vpc_security_group_ids = [ var.acer_security_group_id ]
  associate_public_ip_address = true
  region = var.ec2_aws_region

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = var.ec2_name
  }
}