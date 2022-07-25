variable "api_gateway_region" {
    type = string
    description = "The region in which to create/manage resources"
    default = "us-west-2"
}

variable "rest_api_name"{
    type = string
    description = "Name of the API Gateway created"
    default = "pagerduty_event_receiver"
}

variable "pagerduty_account"{
    type = string
    description = "pagerduty_account_id"
    default = "oxfdcwxlxdkpwgrh"
} 

variable "api_gateway_account_id" {
  type        = string
  description = "The account ID in which to create/manage resources"
  default = " "
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


variable "rest_api_stage_name" {
  type        = string
  description = "The name of the API Gateway stage"
  default     = "dev" //add a stage name as per your requirement
}

