variable "instance_type" {
  type    = string
  default = ""
}



data "aws_ami" "ubuntu" {
  most_recent = "true"
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Canonical

}


resource "aws_instance" "ec2_mumbai" {
  ami           = "ami-00bb6a80f01f03502"
  instance_type = "t2.micro"

  tags = {
    Name = "my_First_instance"
  }
}

output "public_ip" {
  value = aws_instance.ec2_mumbai.public_ip
}