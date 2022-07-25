# use $terraform plan -var "username=anuj"
variable users {
 type = list
 default = ["gaurav","anuj","abc","david"]
}
