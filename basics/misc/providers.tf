provider "aws" {
  region = "us-east-2"
}


terraform {
  backend "s3" {
    bucket = "java-home"
    key    = ".terraform/terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "javahome-tf"
  }
}

#output "vpc_cidr" {
#    value = "${aws_vpc.my_vpc.cidr_block}"
#}