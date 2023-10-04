env = "dev"

#components = {

#  frontend        = {
#    tags = { Monitor = "yes" , env = "dev"}
#  }
#  mongodb         = {
#    tags = { env = "dev"}
#  }
#  catalogue       = {
#    tags = { Monitor = "yes", env = "dev"}
#  }
#  redis           = {
#    tags = { env = "dev"}
#  }
#  user            = {
#    tags = { Monitor = "yes" , env = "dev"}
#  }
#  cart            = {
#    tags = { Monitor = "yes" , env = "dev"}
#  }
#  mysql           = {
#    tags = { env = "dev"}
#  }
#  shipping        = {
#    tags = { Monitor = "yes" , env = "dev"}
#  }
#  rabbitmq        = {
#    tags = { env = "dev"}
#  }
#  payment         = {
#    tags = { Monitor = "yes" , env = "dev"}
#  }
#
#}

tags = {
  company_name = "veerankitek.com"
  business     = "Ecommerce"
  business_unit= "Retail"
  cost_center  = "322"
  project_name = "Roboshop"
}

vpc = {
  main = {
    cidr_block      = "10.0.0.0/16"
    #web_subnet = ["10.0.0.0/24", "10.0.1.0/24"]
    subnets         = {
      web           = { cidr_block = ["10.0.0.0/24", "10.0.1.0/24"] }
      app           = { cidr_block = ["10.0.2.0/24", "10.0.3.0/24"] }
      db            = { cidr_block = ["10.0.4.0/24", "10.0.5.0/24"] }
      public        = { cidr_block = ["10.0.6.0/24", "10.0.7.0/24"] }
    }

  }
}

default_vpc_id    = "vpc-0df387ce1014bca10"
default_vpc_rt    = "rtb-059f39167b3ee0f0a"
allow_ssh_cidr    = [ "172.31.4.252/32" ]
zone_id           = "Z05332201VBHF9VM3Q9N5"
kms_key_id        = "99a36c85-491f-4308-9f5a-a20587017b99"
kms_key_arn       = "arn:aws:kms:us-east-1:155405255921:key/99a36c85-491f-4308-9f5a-a20587017b99"


##we can't define resource blocks in .tfvars
rabbitmq = {
  main = {
    instance_type = "t3.small"
    component     = "rabbitmq"
  }
}

##RDS mysql for shipping module
rds = {
  main = {
    component               = "rds"
    engine                  = "aurora-mysql"
    engine_version          = "5.7.mysql_aurora.2.11.3"
    db_name                 = "yummy"
    instance_count          = 1
    instance_class          = "db.t3.small"
  }
}

##DocumentDb
documentdb = {
  main = {
    component               = "docdb"
    engine                  = "docdb"
    engine_version          = "4.0.0"
    instance_class          = "db.t3.medium"
    db_instance_count       = 1

  }
}

#variable "vpc_id" {}
#variable "engine" {}
#variable "master_username" {}
#variable "master_password" {}
#variable "port" {
#  default = "27017"
#}
#variable "engine_version" {}
#variable "db_instance_count" {}
#variable "instance_class" {}

##Elasticache
elasticache = {
  main = {
    component               = "elasticache"
    engine                  = "redis"
    engine_version          = "6.x"
    replicas_per_node_group = 1
    num_node_groups         = 1
    node_type               = "cache.t3.micro"



  }
}

#variable "component" {}
#variable "env" {}
#variable "subnet_ids" {}
#variable "tags" {}
#variable "sg_subnet_cidr" {}
#variable "kms_key_arn" {}
#variable "vpc_id" {}
#variable "engine" {}
#variable "node_type" {}
#variable "num_cache_nodes" {}
#variable "parameter_group_name" {}
#variable "engine_version" {}
#variable "port" {
#  default = 6379
#}
#variable "replicas_per_node_group" {}
#variable "num_node_groups" {}


