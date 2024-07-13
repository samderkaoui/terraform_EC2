locals {
  instances = {
    web1 = { name = "web1", az = "eu-west-3a" },
    web2 = { name = "web2", az = "eu-west-3b" }
  }
}

resource "random_pet" "id" {
  length    = 2
  separator = "-"
}

resource "aws_instance" "vm" {
  for_each               = local.instances
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids

  tags = merge({
    Name = "${each.value.name}-${random_pet.id.id}"  # Dynamic name with random pet id
  }, var.tags)
}
