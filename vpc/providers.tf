provider "aws" {
  region = "${var.region}"
}


terraform {
  backend "s3" {
    bucket = "java-tf-1234567"
    key    = ".terraform/terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "java-tf-1234567"
  }
}

#output "vpc_cidr" {
#    value = "${aws_vpc.my_vpc.cidr_block}"
#}