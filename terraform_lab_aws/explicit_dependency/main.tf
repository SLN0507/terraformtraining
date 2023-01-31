provider "aws" {
  region = "us-east-2"
}
resource "aws_s3_bucket" "example" {}

resource "aws_instance" "example_c" {
  ami           = data.aws_ami.aws-linux.id
  instance_type = "t2.micro"

  depends_on = [aws_s3_bucket.example]
}

//module "example_sqs_queue" {
//  source  = "terraform-aws-modules/sqs/aws"
//  version = "3.3.0"

//  depends_on = [aws_s3_bucket.example, aws_instance.example_c]
//}

data "aws_ami" "aws-linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-hvm*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


