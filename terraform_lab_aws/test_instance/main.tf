provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "myawsserver" {
  ami           = "ami-0603cbe34fd08cb81"
  instance_type = "t2.micro"

  tags = {
    Name = "aws-ec2-instance"
  }
}

output "myawsserver" {
  value = aws_instance.myawsserver.public_ip
}

