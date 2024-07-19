# terraform_EC2
Module EC2
# MULTI

```
locals {
  instances = {
    web1 = { name = "web1", az = "eu-west-3a" },
    web2 = { name = "web2", az = "eu-west-3b" }
  }
}

module "ec2_instance" {
  source = "github.com/Kaiser016X/terraform_EC2"

#  instance_name      = "my-ec2-instance" que si ju'utilise BASE
  instances          = local.instances si local sinon : var.instances
  instance_type      = "t2.micro"
  ami                = "ami-080fa3659564ffbb1" # AMAZON AMI
  key_name           = module.terraform_keyssh.key_name
  public_subnets     = module.vpc.public_subnets
  #security_group_ids = [module.terraform_sg.sg_ssh_o]
  security_group_ids  = [ module.terraform_sg.sg_ssh_o, module.terraform_sg.sg_web_o]
  tags = {
    "Terraformed" = "True"
  }
}


#EC2

output "instance_ids" {
  value = module.ec2_instance.instance_ids
}

output "public_ips" {
  value = module.ec2_instance.public_ips
}

output "private_ips" {
  value = module.ec2_instance.private_ips
}

output "public_dns" {
  value = module.ec2_instance.public_dns
}

output "private_dns" {
  value = module.ec2_instance.private_dns
}


```

################################################

################################################

################################################

################################################

################################################

# BASE
+ main.tf MAIN
```
module "ec2_instance" {
  source = "github.com/Kaiser016X/terraform_EC2"

  instance_name      = "my-ec2-instance"
  instance_type      = "t2.micro"
  ami                = "ami-080fa3659564ffbb1" # AMAZON AMI
  key_name           = module.terraform_keyssh.key_name
  subnet_id          = module.vpc.public_subnets[0] # selection le premier subnet public le 2eme serait [1]
  #security_group_ids = [module.terraform_sg.sg_ssh_o]
  security_group_ids  = [
    module.terraform_sg.sg_ssh_o,   # First security group
    module.terraform_sg.sg_web_o        # Second security group
  ]
  tags = {
    "Terraformed" = "True"
  }
}


#EC2

output "instance_id" {
  value = module.ec2_instance.instance_id
}

output "public_ip" {
  value = module.ec2_instance.public_ip
}

output "private_ip" {
  value = module.ec2_instance.private_ip
}

output "public_dns" {
  value = module.ec2_instance.public_dns
}

output "private_dns" {
  value = module.ec2_instance.private_dns
}

```
+ main.tf Module
```
resource "aws_instance" "vm1" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids

  tags = merge({
    Name = var.instance_name
  }, var.tags)
}
```
