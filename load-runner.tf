data "aws_ami" "main"{
  owners                    = ["973714476881"]
  name_regex                = "Centos-8-DevOps-Practice"
  most_recent               = true
}

resource "aws_instance" "load-runner" {
  ami = data.aws_ami.main.id
  instance_type = "t3.medium"
  vpc_security_group_ids = ["sg-00cd0cb49be555ef2"]
  tags {
    Name = "load-runner"
  }

  provisioner "remote-exec" {
    connection {
      user = "root"
      password = "DevOps321"
      type = "ssh"
      host = self.public_ip
    }

    inline = [
      "labauto docker",
      "docker pull robotshop/rs-load:latest"
]

  }
}

