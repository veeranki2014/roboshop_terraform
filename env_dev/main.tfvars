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
    cidr_block = "10.0.0.0/16"
    web_subnet_cidr_block = ["10.0.0.0/24"]
  }
}
