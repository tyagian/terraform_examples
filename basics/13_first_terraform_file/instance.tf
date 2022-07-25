# create ssh key
# assign it to ec2 instance
# add security group to allow ssh to instnace from our localhost

# create ssh-key
/*
resource "aws_key_pair" "key-tf" {
  key_name   = "key-tf"
  public_key = file("${path.module}/id_rsa.pub")

}

output "keyname" {
  value = "${aws_key_pair.key-tf.key_name}"
} */


/*output securityGroupDetails {
  value = "${aws_security_group.allow_tls.id}"
}*/


# create instance
resource "aws_instance" "web" {
  ami                    = var.image_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.key-tf.key_name
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
  tags = {
    Name = "first-tf-instance"
  }
  user_data = file("${path.module}/script.sh")
}