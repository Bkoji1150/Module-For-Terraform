
## Root module.....

terraform {
  required_version = ">=0.15"
}

module "networking" {
  source            = "git@github.com:Bkoji1150/module-for-terraform.git//networkmodule"
  cidr_block        = var.cidr_block
  enable_dns        = false
  enable_hostname   = var.enable_hostname
  tagname           = lookup(var.tagname, terraform.workspace)
  cidr_block_public = var.gen-subnet.dev[1]
  availability_zone = var.gen-az.dev[1]
}