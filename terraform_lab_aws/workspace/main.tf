locals {
  instance_types = {
    dev   = "t2.micro"
    stage = "t2.small"
    prod  = "m2.medium"
  }
}
resource "aws_instance" "example" {
  ami           = "ami-0fb653ca2d3203ac1"
  instance_type = local.instance_types[terraform.workspace] 
  tags = {
    Name = "example-server-${terraform.workspace}"
  }
}
