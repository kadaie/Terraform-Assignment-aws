variable "cidr_block" {
  type = string
}
variable "public_subnet_cidr" {
  type = string
}
variable "public_subnet_name" {
  type = string
}
variable "igw_name" {
  type = string
}
variable "rtb_name" {
  type = string
}
variable "sg_name" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "ami" {
  type    = string
  default = "ami-0b36f2748d7665334"
}