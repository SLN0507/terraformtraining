terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  #  required_version = ">= 1.3.0"
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }

  provisioner "local-exec" {
    command = "echo The server's IP address is ${self.private_ip}"
  on_failure = continue
  }
}

output "app_server" {
  value = "${aws_instance.app_server.public_ip}"
}


