terraform {

 required_providers {

   aws = {

     source  = "hashicorp/aws"

     version = "~> 3.0"

   }

 }

}

provider "aws" {

 region = "us-east-2"

}

resource "aws_instance" "myvm" {

 ami           = "ami-0603cbe34fd08cb81"

 instance_type = "t2.micro"

tags =  {
     Name = "${terraform.workspace}"
}
}
