resource "aws_volume_attachment" "ebs_att" {
  count       = length(var.Public_Subnet_Cidr)
  device_name = "/dev/sdh"
  volume_id   = element(aws_ebs_volume.Webserverebs.*.id, count.index)
  instance_id = element(aws_instance.Public-Web-Server.*.id, count.index)
}
resource "aws_volume_attachment" "ebs_att_2" {
  count       = length(var.Public_Subnet_Cidr)
  device_name = "/dev/sdf"
  volume_id   = element(aws_ebs_volume.Webserverebs_ebs_2.*.id, count.index)
  instance_id = element(aws_instance.Public-Web-Server.*.id, count.index)
}