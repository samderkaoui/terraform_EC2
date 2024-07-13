output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.vm1.id
}

output "public_ip" {
  description = "The public IP of the EC2 instance"
  value       = aws_instance.vm1.public_ip
}

output "private_ip" {
  description = "The private IP of the EC2 instance"
  value       = aws_instance.vm1.private_ip
}

output "public_dns" {
  description = "The public DNS of the EC2 instance"
  value       = aws_instance.vm1.public_dns
}

output "private_dns" {
  description = "The private DNS of the EC2 instance"
  value       = aws_instance.vm1.private_dns
}
