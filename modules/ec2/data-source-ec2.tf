data "aws_subnet" "acer_public_subnet_1_1a" {
  id = "subnet-06c85db6ee474174c"
}

data "aws_security_group" "acer_security_group" {
  id = "sg-0acb668c11d08bf9b"
}