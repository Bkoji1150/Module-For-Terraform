output vpc-koji {
  description = "the output of vpc id"
  value = aws_vpc.kj-vpc.id
}

output "kj_IGW" {
  value = aws_internet_gateway.kj-IGW.id
}

output kj-pub-subnet {
  value = aws_subnet.kj-pub-subnet.id
}