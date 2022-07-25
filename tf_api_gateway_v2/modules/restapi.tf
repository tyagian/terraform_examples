resource "aws_api_gateway_rest_api" "pagerduty_webhook_receiver"{
    name = var.rest_api_name
}

resource "aws_api_gateway_resource" "rest_api_resource" {
  rest_api_id = aws_api_gateway_rest_api.pagerduty_webhook_receiver.id
  parent_id = aws_api_gateway_rest_api.pagerduty_webhook_receiver.root_resource_id
  path_part = var.pagerduty_account
}

resource "aws_api_gateway_method" "rest_api_get_method"{
  rest_api_id = aws_api_gateway_rest_api.pagerduty_webhook_receiver.id
  resource_id = aws_api_gateway_resource.rest_api_resource.id
  http_method = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "rest_api_get_method_integration" {
  rest_api_id             = aws_api_gateway_rest_api.pagerduty_webhook_receiver.id
  resource_id             = aws_api_gateway_resource.rest_api_resource.id
  http_method             = aws_api_gateway_method.rest_api_get_method.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = ""
}

/*
resource "aws_api_gateway_integration_response" "rest_api_get_method_integration_response_200" {
  rest_api_id = aws_api_gateway_rest_api.pagerduty_webhook_receiver.id
  resource_id = aws_api_gateway_resource.rest_api_resource.id
  http_method = aws_api_gateway_integration.rest_api_get_method_integration.http_method
  status_code = aws_api_gateway_method_response.rest_api_get_method_response_200.status_code
  response_templates = {
    "application/json" = jsonencode({
      body = "Hello from the movies API!"
    })
  }
} */

//  Creating a lambda resource based policy to allow API gateway to invoke the lambda function:
resource "aws_lambda_permission" "api_gateway_lambda" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_function_name
  principal     = "apigateway.amazonaws.com"
  source_arn = "arn:aws:execute-api:${var.api_gateway_region}:${var.api_gateway_account_id}:${aws_api_gateway_rest_api.pagerduty_webhook_receiver.id}/*/${aws_api_gateway_method.rest_api_get_method.http_method}${aws_api_gateway_resource.rest_api_resource.path}"
}

resource "aws_api_gateway_deployment" "rest_api_deployment" {
  rest_api_id = aws_api_gateway_rest_api.pagerduty_webhook_receiver.id
  triggers = {
    redeployment = sha1(jsonencode([
      aws_api_gateway_resource.rest_api_resource.id,
      aws_api_gateway_method.rest_api_get_method.id,
      aws_api_gateway_integration.rest_api_get_method_integration.id
    ]))
  }
}
resource "aws_api_gateway_stage" "rest_api_stage" {
  deployment_id = aws_api_gateway_deployment.rest_api_deployment.id
  rest_api_id   = aws_api_gateway_rest_api.pagerduty_webhook_receiver.id
  stage_name    = var.rest_api_stage_name
}
