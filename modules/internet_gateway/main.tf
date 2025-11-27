resource "aws_internet_gateway" "acer_internet_gateway" {
  vpc_id = var.vpc_id

  tags = {
    Name = var.internet_gateway_name
  }
}

#TESTER
resource "aws_internet_gateway" "tester_igw" {
  vpc_id = data.aws_vpc.tester_vpc.id

  tags = {
    Name = var.tester_internet_gateway_name
  }
}