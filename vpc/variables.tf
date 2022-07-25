variable "vpc_cidr" {
    description = "Choose cidr for vpc"
    type        = string
    default     = "10.20.0.0/16"
}

variable "region" {
    description = "Choose region for your stack"
    type = string
    default = "us-east-2"
}

/* this can be used with nat ami under private_subnet.tf if we know ami_ids. */
variable "nat_amis" {
    type = map
    default = {
        us-east-1 = "ami-0cff7528ff583bf9a"
        us-east-2 = "ami-02d1e544b84bf7502"
    }
} 