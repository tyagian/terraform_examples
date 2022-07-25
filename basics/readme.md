

1. For vPC provider resource: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc#id
2. In case of remote state file, first Python script can check if remote s3 bucket exist or not before running Terraform file. 

3. 

# For env variables use TF_VAR_X
# Terraform taint: $terraform taint resource_name.resource_type
# $terraform taint aws_security_group.allow_tls but it's recommended to use replace command instead taint. 

4. Terraform version constraint: https://www.terraform.io/language/expressions/version-constraints