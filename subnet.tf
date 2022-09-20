resource "aws_subnet" "Public_subnet" {
  count                   = length(var.Public_Subnet_Cidr)
  vpc_id                  = aws_vpc.DevopsB1_function_1.id
  cidr_block              = element(var.Public_Subnet_Cidr, count.index)
  availability_zone       = element(var.azs, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.vpc_name}-PublicSubnet-${count.index + 1}"
  }

}
resource "aws_subnet" "Private_subnet" {
  count             = length(var.Private_Subnet_Cidr)
  vpc_id            = aws_vpc.DevopsB1_function_1.id
  cidr_block        = element(var.Private_Subnet_Cidr, count.index)
  availability_zone = element(var.azs, count.index)
  tags = {
    Name = "${var.vpc_name}-PrivateSubnet-${count.index + 1}"
  }

}