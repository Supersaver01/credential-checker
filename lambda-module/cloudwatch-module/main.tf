resource "aws_cloudwatch_event_rule" "daily_trigger" {
  name                = var.event_rule_name
  description         = "Triggers credential check daily"
  schedule_expression = "rate(1 day)"
}

resource "aws_cloudwatch_event_target" "invoke_lambda" {
  rule      = aws_cloudwatch_event_rule.daily_trigger.name
  target_id = "InvokeCredentialCheckerLambda"
  arn       = var.lambda_arn
}

resource "aws_lambda_permission" "allow_cloudwatch_to_call" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_arn
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.daily_trigger.arn
}

# resource "aws_cloudwatch_log_group" "lambda" {
#   name = var.log-group_name
#   retention_in_days = 14
# }

