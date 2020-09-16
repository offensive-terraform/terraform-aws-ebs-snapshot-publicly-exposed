resource "tls_private_key" "this" {
  algorithm = "RSA"
}

resource "aws_key_pair" "this" {
  key_name   = "hack"
  public_key = tls_private_key.this.public_key_openssh
}

data "template_file" "user_data" {
  template = file(".terraform/modules/publicly-exposed-ebs-snapshot-inspector/payload.sh")
}

resource "aws_instance" "this" {
  ami                         = "ami-06b263d6ceff0b3dd"
  instance_type               = "t2.micro"
  availability_zone           = "us-east-1a"
  associate_public_ip_address = true
  key_name                    = aws_key_pair.this.key_name
  user_data                   = data.template_file.user_data.rendered
}

resource "aws_ebs_snapshot_copy" "this" {
  source_snapshot_id = var.public_snapshot_id
  source_region      = "us-east-1"
}

resource "aws_ebs_volume" "this" {
  availability_zone = "us-east-1a"
  snapshot_id       = aws_ebs_snapshot_copy.this.id

  depends_on = [aws_ebs_snapshot_copy.this]
}

resource "aws_volume_attachment" "this" {
  device_name  = "/dev/sdh"
  volume_id    = aws_ebs_volume.this.id
  instance_id  = aws_instance.this.id
  force_detach = true

  depends_on = [aws_ebs_volume.this]
}
