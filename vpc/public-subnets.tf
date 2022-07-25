/*
1. subnet creation
2. IGW
3. Route table
4. Subnet association
*/

locals {
  az_names = "${data.aws_availability_zones.azs.names}"
  pub_sub_ids = "${aws_subnet.public.*.id}"
}

resource "aws_subnet" "public" {

  count = "${length(local.az_names)}"
  vpc_id = "${aws_vpc.my_app.id}"
  cidr_block = "${cidrsubnet(var.vpc_cidr, 8, count.index)}" //--> 10.20.1.0/24
  availability_zone = "${data.aws_availability_zones.azs.names[count.index]}"
  # enable subnet settings for auto assigning public-ip
  map_public_ip_on_launch = true 

  tags = {
      Name = "PublicSubnet-${count.index + 1}"
  }
}

// Internet gateway for vPC
resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.my_app.id}"
  tags = {
    Name = "JavaHomeIgw"
  }
}

// route table for public subnet association
// https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table

resource "aws_route_table" "prt" {
  vpc_id = "${aws_vpc.my_app.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags = {
    Name = "JavaHomePRT"
  }
}

// subnet association
resource "aws_route_table_association" "pub_sub_association" {
  count           = "${length(local.az_names)}"
  subnet_id       =  "${local.pub_sub_ids[count.index]}"       //"${aws_subnet.public.*.id[count.index]}"
  route_table_id  =  "${aws_route_table.prt.id}"
}

