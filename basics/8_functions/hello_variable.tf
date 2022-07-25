/* terraform plan -var 'users=["gaurav","anuj","abc","david"]' */
# use $terraform plan -var "username=anuj"

/* example of join function
output printfirst {
    value = "${join("-->",var.users)}"
} */

/* example of changing case 
output changecase {
    value = "${upper(var.users[0])}"
}
*/
