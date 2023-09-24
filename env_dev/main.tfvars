env = "dev"

components = {

  frontend        = {
    tags = { Monitor = "yes" , env = "dev"}
  }
  mongodb         = {
    tags = { env = "dev"}
  }
  catalogue       = {
    tags = { Monitor = "yes", env = "dev"}
  }
  redis           = {
    tags = { env = "dev"}
  }
  user            = {
    tags = { Monitor = "yes" , env = "dev"}
  }
  cart            = {
    tags = { Monitor = "yes" , env = "dev"}
  }
  mysql           = {
    tags = { env = "dev"}
  }
  shipping        = {
    tags = { Monitor = "yes" , env = "dev"}
  }
  rabbitmq        = {
    tags = { env = "dev"}
  }
  payment         = {
    tags = { Monitor = "yes" , env = "dev"}
  }

}

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
    component               = "mysql"
    engine                  = "aurora-mysql"
    engine_version          = "5.7.mysql_aurora.2.11.3"
    db_name                 = "yummy"


  }
}




