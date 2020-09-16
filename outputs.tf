output "ssh_private_key" {
  value = tls_private_key.this.private_key_pem
}

output "ssh_ec2_connect" {
  value = "ssh -h hack.pem ubuntu@${aws_instance.this.public_ip}"
}
