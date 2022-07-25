# use $terraform plan -var "username=anuj"
variable username {
 type = string
 default = "world"   
}

variable age {
    type = number
}