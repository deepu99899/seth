variable "ami" {
  description = "myec2ami"
  type = string
  default = "ami-0614680123427b75e"

}

variable "instance_type" {
    description = "myinstancetype"
    type = string
    default = "t2.micro"
}

variable "key_name" {
    description = "keyname"
    type = string
    default = "deepudon"
    
}