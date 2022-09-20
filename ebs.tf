resource "aws_ebs_volume" "Webserverebs" {
  count             = length(var.Public_Subnet_Cidr)
  availability_zone = element(var.azs, count.index)
  size              = 2

  tags = {
    Name = "${var.vpc_name}-EBS-${count.index + 1}"
  }
}
resource "aws_ebs_volume" "Webserverebs_ebs_2" {
  count             = length(var.Public_Subnet_Cidr)
  availability_zone = element(var.azs, count.index)
  size              = 1

  tags = {
    Name = "${var.vpc_name}-EBS_2-${count.index + 1}"
  }
}