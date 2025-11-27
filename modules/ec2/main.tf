resource "aws_instance" "demo-server-1" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id = data.aws_subnet.acer_public_subnet_1_1a.id
  vpc_security_group_ids = [ data.aws_security_group.acer_security_group.id ]
  associate_public_ip_address = true
  region = var.ec2_region

  tags = {
    Name = var.ec2_name
  }
}