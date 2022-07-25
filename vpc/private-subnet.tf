resource "aws_subnet" "private" {

  count = "${length(slice(local.az_names, 0, 2))}"
  vpc_id = "${aws_vpc.my_app.id}"
  cidr_block = "${cidrsubnet(var.vpc_cidr, 8, count.index + length(local.az_names))}" //--> 10.20.1.0/24
  availability_zone = "${local.az_names[count.index]}"
  tags = {
      Name = "PrivateSubnet-${count.index + 1}"
  }
}

resource "aws_instance" "nat" {
  ami = "${var.nat_amis[var.region]}"            //"${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"
  subnet_id = "${local.pub_sub_ids[0]}"  //"${aws_subnet.public.*.id[0]}"
  source_dest_check =  false
  vpc_security_group_ids = ["${aws_security_group.nat_sg.id}"]
  tags = {
      Name = "JavahomeNat"
  }
}

resource "aws_route_table" "privatert" {
  vpc_id = "${aws_vpc.my_app.id}"
  route {
    cidr_block = "0.0.0.0/0"
    instance_id = "${aws_instance.nat.id}"
    //gateway_id = "${aws_internet_gateway.igw.id}"
  }
tags = {
    Name = "JavaHomePrivateRT"
  }
}

resource "aws_route_table_association" "private_rt_association" {
  count             = "${length(slice(local.az_names,0 ,2))}"
  subnet_id         = "${aws_subnet.private.*.id[count.index]}" // this can be expressed inside local variable
  route_table_id    = "${aws_route_table.privatert.id}"
}

resource "aws_security_group" "nat_sg" {
  name = "nat_sg"
  description = "Allow traffic for private subnets"
  vpc_id = "${aws_vpc.my_app.id}"
  
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      //prefix_list_ids = ["pl-12c4e678"]
  }
}