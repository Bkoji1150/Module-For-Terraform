**The project is to fully understand how to use terraform module directly from github directly 

`Terraform required version for this project!`
 required_version = v0.15.4
'''
'''
`Variables`
'''

`_modules_ `

module networking {
  source            = "git@github.com:Bkoji1150/module-for-terraform.git"
  cidr_block        = <<the data type is string cidr block range for our vpc... for example 10.0.0.0/16>>
  enable_dns        = <<This is a boolean value. true to enable dns name and false to otherwise>>
  enable_hostname   = <<This is a boolean value. true to enablehostname dns name and false to otherwise>>
  tagname           = <<provide a valide tag for you vpc NOTE it should be based on you enviroment and naming standard >>
  cidr_block_public = <<The data type is a string. cidr block range for subnet for instance 10.0.0.0/24>>
  availability_zone = <<Choose an availability zone based on your region>>
}

'''
`providers.tf `

provider aws {
  region  = <<This should contain a region where u wish to run your template>>
  profile = <<This should contain your profile you provided when configuring aws cli The default name is "default">>
}
'''
