output "main_vpc_id" {
  value = "${aws_vpc.main.id}"
}

output "public_1_subnet_id" {
  value = "${aws_subnet.public_1.id}"
}

output "public_route_table_id" {
  value = "${aws_route_table.public.id}"
}
