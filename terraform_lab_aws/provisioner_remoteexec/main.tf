provider "aws" {
 region = "us-west-2"
 }
resource "aws_instance" "myawsserver" {
  ami = "ami-830c94e3"
  instance_type = "t2.micro"
  key_name = "terraform-exec"
provisioner "remote-exec" {
    inline = [
     "touch /tmp/narender",
      "sudo mkdir /root/naren"
     ]
}
provisioner "remote-exec" {
    inline = [
          "sudo apt-get update",
      "sudo apt-get install apache2 -y",
          "sudo systemctl start apache2",
    ]
  }
provisioner "file" {
    source      = "terraform.tfstate.backup"
    destination = "/tmp/"
  }
 connection {
    type     = "ssh"
    user     = "ubuntu"
    insecure = "true"
    private_key = file("/Users/nare8518/Downloads/terraform-exec.pem")
    host     =  aws_instance.myawsserver.public_ip
  }
}
output "instance_region" {
value =  aws_instance.myawsserver.availability_zone
}
