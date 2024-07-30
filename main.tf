resource "aws_instance" "vm" {
  for_each               = var.instances
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = each.key == "web1" ? var.public_subnets[0] : var.public_subnets[1]
  vpc_security_group_ids = var.security_group_ids

  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
  }


  tags = merge({
    Name = "${each.value.name}"
  }, var.tags)
}
