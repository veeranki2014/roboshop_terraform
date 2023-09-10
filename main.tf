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
  web_subnet                  = each.value["web_subnet"]

  env               = var.env
  tags              = var.tags


}






