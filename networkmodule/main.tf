### child network modules....

resource "aws_vpc" "kj-vpc" {
  cidr_block = var.cidr_block
  instance_tenancy = "default"
  enable_dns_support = var.enable_dns
  enable_dns_hostnames = var.enable_hostname

  tags = {
    Name = var.tagname
  }
}

resource "aws_internet_gateway" "kj-IGW" {
  vpc_id = aws_vpc.kj-vpc.id

  tags = {
    Name = "kj-IGW"
  }
}
  resource "aws_subnet" "kj-pub-subnet" {
  vpc_id                  = aws_vpc.kj-vpc.id
  cidr_block              = var.cidr_block_public
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = "kj-pub-subnet"
  }
}

resource "aws_route_table" "kj-RT-private" {
  vpc_id = aws_vpc.kj-vpc.id
  tags = {
    Name = "priv-subnet"
  }
}

resource "aws_route_table_association" "pubic_RT_assoc" {
  subnet_id      = aws_subnet.kj-pub-subnet.id
  route_table_id = aws_route_table.kj-RT-public.id
}

resource "aws_route_table_association" "private_RT_assoc" {
  subnet_id      = aws_subnet.kj-pri-subnet.id
  route_table_id = aws_route_table.kj-RT-private.id
}


