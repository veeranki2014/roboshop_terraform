resource "null_resource" "app" {
  provisioner "local-exec" {
    command = "Hello World - env is ${var.env}"
  }
}

