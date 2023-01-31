provider "aws" {
  profile = "default"
  #  region  = "us-west-2"
}

resource "aws_s3_bucket" "tf_course" {
  bucket = "nasinghn-test-bucket"
  #  acl = "private"
}

resource "aws_default_vpc" "narender_default" {}

resource "aws_security_group" "test_sg" {
  name        = "test_sg"
  description = "Test service group"


  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
