variable "region" {
  default = "eu-central-1"
}
variable "ami_name_value" {
  default = "ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-*"
}

variable "ami_virtualization_type" {
  default = "hvm"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "iscreate" {
  default = "true"
}
variable "keyname" {
  default = "smita2"
}

variable "sg_id" {
  default = "sg-0f57e5ccc8b88ef1e"
}

variable "vpc_id" {
 default = "vpc-0c74e6b1fedf4516d"
 }
