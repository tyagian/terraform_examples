
output "base_url" {
  value = aws_api_gateway_deployment.pagerduty_receiver_test.invoke_url
}
