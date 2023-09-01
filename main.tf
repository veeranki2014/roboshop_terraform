module "instances" {
  for_each          = var.components
  source            = "git::https://github.com/veeranki2014/tf_module_app.git"
  component         = each.key
  env               = var.env
  tags              = each.value["tags"]
}