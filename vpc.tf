resource "aws_vpc" "DevopsB1_function_1" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name = "${var.vpc_name}"
  }
}

resource "aws_internet_gateway" "DevopsB1_IGW" {
  vpc_id = aws_vpc.DevopsB1_function_1.id
  tags = {
    Name = "${var.vpc_IGW}"
  }
}