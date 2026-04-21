output "instance_id" {
  description = "The ID of the created EC2 instance"
  value       = aws_instance.instance_name.id

}

output "public_ip" {
  description = "The public IP address of the created EC2 instance"
  value       = aws_instance.instance_name.public_ip
}

output "private_ip" {
  description = "The private IP address of the created EC2 instance"
  value       = aws_instance.instance_name.private_ip
}