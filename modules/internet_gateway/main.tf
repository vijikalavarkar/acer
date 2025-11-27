resource "aws_internet_gateway" "acer_internet_gateway" {
  vpc_id = var.vpc_id

  tags = {
    Name = var.internet_gateway_name
  }
}
