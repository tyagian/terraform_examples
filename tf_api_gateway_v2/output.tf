/*
output "base_url" {
  value = aws_api_gateway_deployment.pagerduty_receiver_test.invoke_url
}
*/

output "rest_api_url" {
    value = module.api_gateway.rest_api_url
}
