/* BASEEEEEEEEEEE
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
*/


output "instance_ids" {
  description = "The IDs of the EC2 instances"
  value       = { for k, v in aws_instance.vm : k => v.id }
}

output "public_ips" {
  description = "The public IPs of the EC2 instances"
  value       = { for k, v in aws_instance.vm : k => v.public_ip }
}

output "private_ips" {
  description = "The private IPs of the EC2 instances"
  value       = { for k, v in aws_instance.vm : k => v.private_ip }
}

output "public_dns" {
  description = "The public DNS of the EC2 instances"
  value       = { for k, v in aws_instance.vm : k => v.public_dns }
}

output "private_dns" {
  description = "The private DNS of the EC2 instances"
  value       = { for k, v in aws_instance.vm : k => v.private_dns }
}
