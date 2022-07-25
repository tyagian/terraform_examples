
# create instance
/* will be importing from module
resource "aws_instance" "web" {
  ami                    = var.image_id
  instance_type          = var.instance_type
  #key_name               = aws_key_pair.key-tf.key_name
  #vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
  #tags = {
  #  Name = "first-tf-instance"
  #}
  #user_data = file("${path.module}/script.sh")
} */

module "mywebserver" {

  source        = "./modules/webserver"
  key           = file("${path.module}/id_rsa.pub")
  image_id      = "${var.image_id}"  #"ami-02d1e544b84bf7502"
  instance_type = "${var.instance_type}"     #"t2.small"
  key_name      = "${var.key_name}"
}

output "mypublicIp" {

  value = module.mywebserver.publicIP

}