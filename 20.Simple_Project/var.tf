#Defined Variable access keys
variable "access_key" {
  type = string
}

#Defined variable Secret keys
variable "secret_key" {
  type = string
}

#Defined variable regin
variable "region" {
  type = string
}

#Defined variable instance type
variable "instance_type" {
  type = string
}

#Defined variable image id
variable "image_id" {
  type = string
}

#Defined variable vpc-id
variable "vpc_id" {
  type = string
}


#Defined variable regin
variable "cidr_blocks" {
  type = list(string)
}
