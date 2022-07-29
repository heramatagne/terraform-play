#Declaring the variables

variable "aws_region" {
  description = "Automatically defines the region"
  type = string
}

variable "instance_type" {
  description = "Instance type"
  type = map
}

variable "key_name" {
  description = "Key name"
  type = string
}

variable "availability_zone" {
  description = "Availability zone"
  type = string
}

variable "ec2_name" {
  type = string
}

variable "ec2_sg" {
 type =  string
}

variable "aws_vpc" {
  type = string
}