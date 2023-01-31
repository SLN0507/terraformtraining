provider "aws" {
  region = "us-east-2"
  alias  = "useast2"
}

provider "aws" {
  region = "us-east-1"
  alias  = "useast1"
}

resource "aws_instance" "myawsserver1" {
  ami           = "ami-0c94855ba95c71c99"
  instance_type = "t2.micro"
  provider      = aws.useast1
  tags = {
    Name = "Techlanders-aws-ec2-instance1"
    Env  = "Prod"
  }
}
resource "aws_instance" "myawsserver2" {
  ami           = "ami-0603cbe34fd08cb81"
  provider      = aws.useast2
  instance_type = "t2.micro"

  tags = {
    Name = "Techlanders-aws-ec2-instance2"
    Env  = "Prod"
  }
}
