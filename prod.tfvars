region          = "us-east-1"
cidr_block      = "10.0.0.0/16"
enable_dns      = true
enable_hostname = true
gen-subnet = {
  dev = ["10.0.0.0/24", "10.0.1.0/24"]
}
gen-az = {
  dev = ["us-east-1a", "us-east-1b"]
}