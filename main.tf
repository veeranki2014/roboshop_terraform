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

#module "app_server" {
#  source                      = "git::https://github.com/veeranki2014/tf_module_app.git"
#  tags                        = var.tags
#  env                         = var.env
#  component                   = "test"
#  //subnet_id                   = module.vpc["subnet_ids"]["app"]["subnet_ids"][0]
#  vpc_id                      = lookup(lookup(module.vpc, "main", null ), "vpc_id", null)
#  subnet_id                   = lookup(lookup(lookup(lookup( module.vpc, "main", null ), "subnet_ids" , null), "app", null), "subnet_ids", null)[0]
#}

#module "rabbitmq"{
#  source        = "git::https://github.com/veeranki2014/tf-module-rabbitmq.git"
#  for_each      = var.rabbitmq
#  component     = each.value["component"]
#  instance_type = each.value["instance_type"]
#  env           = var.env
#  tags          = var.tags
#  vpc_id        = lookup(lookup(module.vpc, "main", null ), "vpc_id", null)
#  sg_subnet_cidr = lookup(lookup(lookup(lookup(var.vpc, "main", null), "subnets", null), "app", null),"cidr_block",null)
#  subnet_id    = lookup(lookup(lookup(lookup( module.vpc, "main", null ), "subnet_ids" , null), "db", null), "subnet_ids", null)[0]
#  allow_ssh_cidr = var.allow_ssh_cidr
#  zone_id         = var.zone_id
#  kms_key_id      = var.kms_key_id
#}

#module "rds" {
#  source    = "git::https://github.com/veeranki2014/tf-module-rds.git"
#
#  for_each            = var.rds
#  component           = each.value["component"]
#  engine              = each.value["engine"]
#  engine_version      = each.value["engine_version"]
#  db_name             = each.value["db_name"]
#  instance_count      = each.value["instance_count"]
#  instance_class      = each.value["instance_class"]
#  subnet_ids          = lookup(lookup(lookup(lookup( module.vpc, "main", null ), "subnet_ids" , null), "db", null), "subnet_ids", null)
#  vpc_id        = lookup(lookup(module.vpc, "main", null ), "vpc_id", null)
#  sg_subnet_cidr = lookup(lookup(lookup(lookup(var.vpc, "main", null), "subnets", null), "app", null),"cidr_block",null)
#
#
#  env                 = var.env
#  tags                = var.tags
#  #kms_key_id          = var.kms_key_id
#  kms_key_arn          = var.kms_key_arn
#
#
#}

#module "documentdb" {
#  source    = "git::https://github.com/veeranki2014/tf-module-documentdb.git"
#
#  for_each            = var.documentdb
#  component           = each.value["component"]
#  engine              = each.value["engine"]
#  engine_version      = each.value["engine_version"]
#  instance_class      = each.value["instance_class"]
#  db_instance_count   = each.value["db_instance_count"]
#
#
#  subnet_ids          = lookup(lookup(lookup(lookup( module.vpc, "main", null ), "subnet_ids" , null), "db", null), "subnet_ids", null)
#  vpc_id        = lookup(lookup(module.vpc, "main", null ), "vpc_id", null)
#  sg_subnet_cidr = lookup(lookup(lookup(lookup(var.vpc, "main", null), "subnets", null), "app", null),"cidr_block",null)
#
#  env                 = var.env
#  tags                = var.tags
#  #kms_key_id          = var.kms_key_id
#  kms_key_arn          = var.kms_key_arn
#
#}

#module "elasticache" {
#  source    = "git::https://github.com/veeranki2014/tf-module-elasticache.git"
#
#  for_each            = var.elasticache
#  component           = each.value["component"]
#  engine              = each.value["engine"]
#  engine_version      = each.value["engine_version"]
#  replicas_per_node_group = each.value["replicas_per_node_group"]
#  num_node_groups     = each.value["num_node_groups"]
#  node_type           = each.value["node_type"]
#  subnet_ids          = lookup(lookup(lookup(lookup( module.vpc, "main", null ), "subnet_ids" , null), "db", null), "subnet_ids", null)
#  vpc_id              = lookup(lookup(module.vpc, "main", null ), "vpc_id", null)
#  sg_subnet_cidr      = lookup(lookup(lookup(lookup(var.vpc, "main", null), "subnets", null), "app", null),"cidr_block",null)
#  env                 = var.env
#  tags                = var.tags
#  #kms_key_id          = var.kms_key_id
#  kms_key_arn          = var.kms_key_arn
#
#}

module "alb" {
  source                = "git::https://github.com/veeranki2014/tf-module-alb.git"
  for_each              = var.alb
  component             = each.value["component"]
  name                  = each.value["name"]
  internal              = each.value["internal"]
  load_balancer_type    = each.value["load_balancer_type"]

  vpc_id                = lookup(lookup(module.vpc, "main", null ), "vpc_id", null)
  sg_subnet_cidr        = each.value["name"] == "public" ? ["0.0.0.0/0"] : local.app_web_subnet_cidr
  subnets_ids           = lookup(lookup(lookup(lookup( module.vpc, "main", null ), "subnet_ids" , null), each.value["subnets_ref"], null), "subnet_ids", null)

  tags                  = var.tags
  env                   = each.value["env"]



}
#variable "env" {}
#variable "component" {}
#variable "vpc_id" {}
#variable "port" {
#  default = 80
#}
#variable "sg_subnet_cidr" {}
#variable "name" {}
#variable "internal" {}
#variable "load_balancer_type" {}
#variable "subnets" {}
#variable "tags" {}



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




