resource "aws_route_table" "acer_public_route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = var.acer_public_route_table_cidr_blocks
    gateway_id = var.internet_gateway_id
  }

  tags = {
    Name = var.acer_public_route_table_name
  }
}