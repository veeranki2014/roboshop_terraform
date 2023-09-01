env = "dev"

components = {

  frontend        = {
    tags = { Monitor = "yes" , env = "dev"}
  }
  mongodb         = {}
  catalogue       = {
    tags = { env = "dev"}
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
