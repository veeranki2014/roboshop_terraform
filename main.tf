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
  default_vpc_rt              = var.default_vpc_rt
}

module "app_server" {
  source                      = "git::https://github.com/veeranki2014/tf_module_app.git"
  tags                        = var.tags
  env                         = var.env
  component                   = "test"
  //subnet_id                   = module.vpc["subnet_ids"]["app"]["subnet_ids"][0]
  vpc_id                      = lookup(lookup(module.vpc, "main", null ), "vpc_id", null)
  subnet_id                   = lookup(lookup(lookup(lookup( module.vpc, "main", null ), "subnet_ids" , null), "app", null), "subnet_ids", null)[0]
}

module "rabbitmq"{
  source        = "git::https://github.com/veeranki2014/tf-module-rabbitmq.git"
  for_each      = var.rabbitmq
  component     = each.value["component"]
  instance_type = each.value["instance_type"]
  env           = var.env
  tags          = var.tags
  vpc_id        = lookup(lookup(module.vpc, "main", null ), "vpc_id", null)
  sg_subnet_cidr = lookup(lookup(lookup(lookup(module.vpc, "main", null), "subnets_ids", null), "app", null),"cidr_block",null)
  subnet_id    = lookup(lookup(lookup(lookup( module.vpc, "main", null ), "subnet_ids" , null), "db", null), "subnet_ids", null)[0]
}

#output "subnet_ids" {
#  value = module.vpc
#}

#output "vpc_id" {
#  value = module.vpc
#}
#
#Outputs:
#
#vpc_id = {
#"main" = {
#"subnet_ids" = {
#"app" = {
#"subnet_ids" = [
#"subnet-042afa15f0549b949",
#"subnet-08c3c231d2d95a10e",
#]
#}
#"db" = {
#"subnet_ids" = [
#"subnet-01c0a5f109112e328",
#"subnet-06e44b48da411a0ba",
#]
#}
#"public" = {
#"subnet_ids" = [
#"subnet-051c6cf5717f5fb74",
#"subnet-0cd13b7492e99f5aa",
#]
#}
#"web" = {
#"subnet_ids" = [
#"subnet-06e4480d2a5c7967f",
#"subnet-0a157e01878831e9c",
#]
#}
#}
#"vpc_id" = "vpc-0ca51c72d39063d2d"
#}
#}




