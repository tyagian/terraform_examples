#terraform plan -var "username=anuj" -var "age=21"

/*variable username {
    
} */

output printname {
    value = "Hello, ${var.username}, your age is ${var.age}"
}