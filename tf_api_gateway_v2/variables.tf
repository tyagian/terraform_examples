variable "region" {
  type        = string
  description = "The region in which to create/manage resources"
  default     = "us-east-2"
}

variable "account_id" {
  type        = string
  description = "The account ID in which to create/manage resources"
  default = ""
} //value comes from main.tf


variable "lambda_function_name"{
  type        = string
  description = "The account ID in which to create/manage resources"
  default = "pagerduty_processor"
}


variable "lambda_function_arn"{
  type        = string
  description = "The account ID in which to create/manage resources"
  default = " "
}

