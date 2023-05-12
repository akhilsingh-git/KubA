output "instance_public_ip" {
  value       = aws_instance.ubuntu_instance.public_ip
  description = "The public IP address of the Ubuntu instance."
}

output "instance_public_dns" {
  value       = aws_instance.ubuntu_instance.public_dns
  description = "The public DNS of the Ubuntu instance."
}

output "private_key" {
  value       = tls_private_key.generated_key_pair.private_key_pem
  description = "The private key for the generated SSH key pair."
  sensitive   = true
}

