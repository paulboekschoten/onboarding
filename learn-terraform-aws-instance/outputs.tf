output "instance_id" {
    description = "ID of the EC2 instance"
    value = aws_instance.app_server_paul.id
}

output "instance_public_ip" {
    description = "Public IP address of the EC2 instance"
    value = aws_instance.app_server_paul.public_ip
}