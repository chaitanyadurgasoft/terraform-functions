resource "aws_route_table" "Public_route" {
  vpc_id = aws_vpc.DevopsB1_function_1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.DevopsB1_IGW.id
  }
  tags = {
    Name = "${var.vpc_name}-PublicRoute"
  }
}
resource "aws_route_table" "Private_route" {
  vpc_id = aws_vpc.DevopsB1_function_1.id
  tags = {
    Name = "${var.vpc_name}-PrivateRoute"
  }
}

resource "aws_route_table_association" "Public_route_assoc" {
  count          = length(var.Public_Subnet_Cidr)
  subnet_id      = element(aws_subnet.Public_subnet.*.id, count.index)
  route_table_id = aws_route_table.Public_route.id
}
resource "aws_route_table_association" "Private_route_assoc" {
  count          = length(var.Private_Subnet_Cidr)
  subnet_id      = element(aws_subnet.Private_subnet.*.id, count.index)
  route_table_id = aws_route_table.Private_route.id
}