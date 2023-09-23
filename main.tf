#module "instances" {
#  for_each          = var.components
#  source            = "git::https://github.com/veeranki2014/tf_module_app.git"
#  component         = each.key
#  env               = var.env
#  tags              = merge(each.value["tags"], var.tags)
#}

module "vpc"{
  source                      = "git::https://github.com/veeranki2014/tf-module-vpc.git"
  for_each                    = var.vpc
  cidr_block                  = each.value["cidr_block"]
  subnets                     = each.value["subnets"]

  env                         = var.env
  tags                        = var.tags
  default_vpc_id              = var.default_vpc_id
}

module "app_server" {
  source                      = "git::https://github.com/veeranki2014/tf_module_app.git"
  tags                        = var.tags
  env                         = var.env
  component                   = "test"
  //subnet_id                   = module.vpc["subnet_ids"]["app"]["subnet_ids"][0]
  subnet_id                   = lookup(lookup(lookup(lookup( module.vpc, "main", null ), "subnet_ids" , null), "app", null), "subnet_ids", null)[0]
}

#output "subnet_ids" {
#  value = module.vpc
#}





