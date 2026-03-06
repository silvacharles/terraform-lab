output "vm_ip" {
  description = "IP da VM Criada na AWS"
  value       = aws_instance.vm.public_ip
}
