output "public_ip" {
  description = "Public IP of the Asterisk server"
  value       = aws_instance.asterisk.public_ip
}

output "private_ip" {
  description = "Private IP of the Asterisk server"
  value       = aws_instance.asterisk.private_ip
}

output "ssh_command" {
  description = "Example SSH command"
  value       = "ssh rocky@${aws_instance.asterisk.public_ip}"
}

output "sip_server" {
  description = "SIP server address"
  value       = "${aws_instance.asterisk.public_ip}:5060"
}
