#Create an EC2 instance of type Linux 2
resource "aws_instance" "my_linux2_instance" {
  ami = data.aws_ami.linux.id
  instance_type = var.instance_type["dev"]
  tags = {
    Name = var.ec2_name
  }
  availability_zone = "us-west-2b"
  key_name = var.key_name
  vpc_security_group_ids = [ aws_security_group.tf_ec2_sg.id ]
}

#Create a VPC with 
resource "aws_vpc" "tf_vpc" {
  cidr_block       = "10.123.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = var.aws_vpc
  }
  
}

#Create a sg for EC2 instance.
resource "aws_security_group" "tf_ec2_sg" {
  name        = "ec2_sg"
  description = "Allow inbound traffic"

  ingress {
    description      = "TLS from VPC"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = ["10.123.0.0/16"]
  }

    ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["172.126.69.2/32"]
  }

    ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = var.ec2_sg
  }
}  

#create an AMI using data source
data "aws_ami" "linux" {
  most_recent = true
  filter {
    name = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.*.1-x86_64-gp2"]  #ami location
  }
  filter {
    name = "virtualization-type" 
    values = [ "hvm" ]  
  }
  owners = [ "amazon" ] #owner of the ami
}


