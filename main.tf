
## Root module.....

terraform {
  required_version = ">=0.15"
}

module "networking" {
  source            = "git@github.com:Bkoji1150/module-for-terraform.git//networkmodule"
  cidr_block        = var.cidr_block
  enable_dns        = var.enable_dns
  enable_hostname   = var.enable_hostname
  tagname           = lookup(var.tagname, terraform.workspace)
  cidr_block_public = var.gen-subnet.dev[1]
  availability_zone = var.gen-az.dev[1]
  cidr_block_pri    = var.gen-subnet.dev[0]
  availability_pri  = var.gen-az.dev[0]
}