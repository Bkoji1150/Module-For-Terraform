
## Root module.....

terraform {
  required_version = ">=0.15"
}

module "networking" {
  source            = "git@github.com:Bkoji1150/module-for-terraform.git"
  cidr_block        = var.cidr_block
  enable_dns        = var.enable_dns
  enable_hostname   = var.enable_hostname
  tagname           = lookup(var.tagname, terraform.workspace)
  cidr_block_public = var.gen-subnet.dev[1]
  availability_zone = var.gen-az.dev[1]
}


resource "aws_subnet" "kj-pri-subnet" {
  vpc_id            = module.networking.vpc-koji
  cidr_block        = var.gen-subnet.dev[0]
  availability_zone = var.gen-az.dev[0]

  tags = {
    Name = "kj-pri-subnet"
  }
}

resource "aws_route_table" "kj-RT-public" {
  vpc_id = module.networking.vpc-koji
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = module.networking.kj_IGW
  }
  tags = {
    Name = "kj-RT-public"
  }
}

resource "aws_route_table" "kj-RT-private" {
  vpc_id = module.networking.vpc-koji
  tags = {
    Name = lookup(var.tagname, terraform.workspace)
  }
}

resource "aws_route_table_association" "pubic_RT_assoc" {
  subnet_id      = module.networking.kj-pub-subnet
  route_table_id = aws_route_table.kj-RT-public.id
}

resource "aws_route_table_association" "private_RT_assoc" {
  subnet_id      = aws_subnet.kj-pri-subnet.id
  route_table_id = aws_route_table.kj-RT-private.id
}