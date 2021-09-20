variable "region" {
  type        = string
  description = "variable for for region"
}

variable "cidr_block" {
  type        = string
  description = "provide cidr block for vpc"
}

variable "enable_dns" {
  type        = bool
  description = "select true to enable dns"
}

variable "enable_hostname" {
  type        = bool
  description = "select true to enable dns hostname"
}

variable "gen-subnet" {
  type = map(list(string))
}

variable "tagname" {
  type = map(any)
  default = {
    dev  = "test-vpc"
    prod = "Prod-vpc"
  }
}

variable "gen-az" {
  type = map(list(string))
}

#  lookup({env1="dev", env2="prod"}, "env2")