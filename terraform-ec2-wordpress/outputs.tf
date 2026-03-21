output "public_ip" {
  description = "IP da VM Criada na AWS"
  value       = aws_instance.wordpress_server.public_ip
}