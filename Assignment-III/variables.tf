# modules/networking/variables.tf
variable "az-a" {
  description = "Availability Zone A"
}
variable "az-b" {
  description = "Availability Zone B"
}
variable "vpc_cidr" {}
variable "project_name" {}
variable "keyname" {}
variable "private_instance_name" {}
variable "private_instance_type" {
  type = string
}
variable "bastion_instance_type" {
  type = string
}
variable "bastion_instance_name" {}
variable "sg_name" {}
variable "ami" {
  type = string
}
