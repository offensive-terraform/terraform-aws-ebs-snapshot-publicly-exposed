output "ssh_private_key" {
  value = tls_private_key.this.private_key_pem
}

output "ssh_ec2_connect" {
  value = "ssh -i hack.pem ubuntu@${aws_instance.this.public_ip}"
}

output "ebs_volume_mount_path" {
  value = "/usr/src/hack"
}
