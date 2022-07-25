# use $terraform plan -var "username=anuj"
variable usersage {
 type = map
 default = {
     anuj = 30
     saurav = 22
 }
}

/* 
#case 1: using manual key string in lookup
output "usersage" {
    value = "my name is anuj and my age is ${lookup(var.usersage,"anuj")}"
} */


/* 
#case 2: By passing variable in lookup function
variable "username" {
    type = string
}

output "usersage" {
    value = "my name is ${var.username} and my age is ${lookup(var.usersage,"anuj")}"
} */

# Case3: By passing username variable through command-line
output "usersage" {
    value = "my name is ${var.username} and my age is ${lookup(var.usersage,"anuj")}"
}