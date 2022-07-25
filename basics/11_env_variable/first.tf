# using custom name for terraform variable file
# export TF_VAR_username="anuj"
# terraform plan -var-file=development.tfvars

variable "username" {
    type = string
}

output printname {
    value = "Hello, ${var.username}"
}