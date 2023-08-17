output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "subnet_staging_public_a" {
  value = tolist("${aws_subnet.public_subnet_az_a.*.id}")
}

output "subnet_staging_public_b" {
  value = tolist("${aws_subnet.public_subnet_az_b.*.id}")
}

output "subnet_staging_public_c" {
  value = tolist("${aws_subnet.public_subnet_az_c.*.id}")
}

output "subnet_staging_private_a" {
  value = tolist("${aws_subnet.private_subnet_az_a.*.id}")
}

output "subnet_staging_private_b" {
  value = tolist("${aws_subnet.private_subnet_az_b.*.id}")
}

output "subnet_staging_private_c" {
  value = tolist("${aws_subnet.private_subnet_az_c.*.id}")
}

output "private_subnet_az_a" {
  value = aws_route_table.private_subnet_az_a
}

output "private_subnet_az_b" {
  value = aws_route_table.private_subnet_az_b
}

output "private_subnet_az_c" {
  value = aws_route_table.private_subnet_az_c
}

output "public_subnet" {
  value = aws_route_table.public_subnet
}