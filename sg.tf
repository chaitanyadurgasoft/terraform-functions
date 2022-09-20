resource "aws_security_group" "sg_webserver" {
  name   = "Webserver-Sg"
  vpc_id = aws_vpc.DevopsB1_function_1.id
  dynamic "ingress" {
    for_each = local.ingress_rules1
    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

    }
  }
  dynamic "ingress" {
    for_each = local.ingress_rules2
    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}