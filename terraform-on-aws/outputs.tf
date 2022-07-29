# define output

output "public_ip_address" {
  value = aws_instance.my_linux2_instance.public_ip
}

output "private_ip_address" {
  value = aws_instance.my_linux2_instance.private_ip
}

output "server_id" {
  value = aws_instance.my_linux2_instance.id
}