module "lambda_credential_checker" {
  source = "../lambda-module"

  iam_role_name   = "demo-lambda-role"
  iam_policy_name = "demo-lambda-policy"
  function_name   = "credentialChecker"
  runtime         = "python3.8"
  filename        = "/Users/shefiuyusuf/Library/Mobile Documents/com~apple~CloudDocs/Documents/GitHub/terraform-assignment/lambda-module/password-rotate.zip"
  handler         = "lambda_function.lambda_handler"
  
}

module "eventbridge_trigger" {
  source     = "./../lambda-module/cloudwatch-module"
  event_rule_name = "daily-trigger-demo"
  lambda_arn = "arn:aws:lambda:us-east-1:969036648835:function:credentialChecker"
}

# module "sns_topic" {
#   source          = "./../lambda-module/sns-module"
#   topic_name      = "invoke_lambda"
#   notification_email = "mailsupersaver@gmail.com"
# }