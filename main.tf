provider "aws" {
  region = "${var.region}"
}

data "aws_ami" "ubuntu" {
  most_recent = true
   owners    = ["099720109477"]

  filter {
    name   = "name"
    values = ["${var.ami_name_value}"]
  }

  filter {
    name   = "virtualization-type"
    values = ["${var.ami_virtualization_type}"]
  }

}

/*
// Use Secuity Group module to create security group
module "security_group" {
  source = "git::https://github.com/Patelvijaykumar/terraform-aws-security-group"
  vpc_id = "${var.vpc_id}"
}
*/

resource "aws_security_group" "allow_all" {
  count       = "${var.iscreate == "" ? 1 : 0}"
  name        = "instance_sg"
  description = "Allow all inbound traffic for security group"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    prefix_list_ids = ["pl-12c4e678"]
  } 
}

resource "aws_instance" "web" {
  ami                    = "${data.aws_ami.ubuntu.id}"
  instance_type          = "${var.instance_type}"
  
key_name               = "${var.keyname}"

  
}

resource "aws_s3_bucket" "b" {
  bucket = "my-test-bucketanant02"
  

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}


