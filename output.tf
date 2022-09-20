output "subnet" {
  value = aws_subnet.Public_subnet.*.id
}

