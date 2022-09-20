resource "aws_instance" "Public-Web-Server" {
  count                       = length(var.Public_Subnet_Cidr)
  ami                         = lookup(var.ami, var.region)
  instance_type               = "t2.micro"
  key_name                    = lookup(var.key, var.region)
  associate_public_ip_address = true
  subnet_id                   = element(aws_subnet.Public_subnet.*.id, count.index)
  vpc_security_group_ids      = ["${aws_security_group.sg_webserver.id}"]
  tags = {
    Name = "${var.vpc_name}-WebServer-${count.index + 1}"
  }
  user_data = <<EOF
#!/bin/bash
apt update -y
apt install nginx -y
service nginx start
PVTIP=`curl -sL http://169.254.169.254/latest/meta-data/local-ipv4`
echo "*************************************************************" 
echo "<h1>$PVTIP</h1>" >> /var/www/html/index.nginx-debian.html
echo "*************************************************************"
echo "<h1>${var.vpc_name}-WebServer-${count.index + 1}" >> /var/www/html/index.nginx-debian.html
echo "*************************************************************"
EOF

}
resource "aws_instance" "Private-Web-Server" {
  count                  = length(var.Private_Subnet_Cidr)
  ami                    = var.ami
  instance_type          = "t2.micro"
  key_name               = "AWSB4-OHIO"
  subnet_id              = element(aws_subnet.Private_subnet.*.id, count.index)
  vpc_security_group_ids = ["${aws_security_group.sg_webserver.id}"]
  tags = {
    Name = "${var.vpc_name}-WebServer-Private-${count.index + 1}"
  }

}