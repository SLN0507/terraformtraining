provider "aws" {
  region = "us-west-2"
}
// variable "server_names" {
//  description = "Create virtual machines with these names"
//  type        = list(string)
//  default     = ["myvm1", "myvm2"]
//}
resource "aws_instance" "myawsserver" {
  ami = "ami-0c09c7eb16d3e8e70"
  instance_type = "t2.micro"
  key_name = "terraform-new"
  count = 2
  tags = {
    Name = "Techlanders-aws-ec2-instance.${count.index}"
    env = "test"
//   count = length(var.server_names)
//  tags = {
//    Name = var.server_names[count.index]
//    env = "test"

  }
}
//output "Private-IP-0" {
// value = aws_instance.myawsserver.0.private_ip
//}
//output "Private-IP-1" {
// value = aws_instance.myawsserver.1.private_ip
//}
//output "Private-IP" {
// value = aws_instance.myawsserver[*].private_ip
//}
output "Private-IP" {
value = {
  for instance in aws_instance.myawsserver:
    instance.id => instance.private_ip
 }
}
