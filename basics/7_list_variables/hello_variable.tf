/*
terraform plan -var 'users=["gaurav","anuj","abc","david"]'
*/
# use $terraform plan -var "username=anuj"

variable users {
 type = list
}

output printfirst {
    value = "first user is ${var.users[3]}"
}