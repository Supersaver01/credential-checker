resource "aws_iam_role" "iam_for_lambda" {
  name               = var.iam_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_policy" "iam_for_lambda" {
  name               = var.iam_policy_name
  policy = data.aws_iam_policy_document.lambda_policy.json
}

resource "aws_iam_role_policy_attachment" "lambda_policy_attachment" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.iam_for_lambda.arn
}

resource "aws_lambda_function" "credential_checker" {
  function_name = var.function_name
  handler       = var.handler
  runtime       = var.runtime
  role          = aws_iam_role.iam_for_lambda.arn
  filename      = var.filename
  source_code_hash = filebase64sha256("/Users/shefiuyusuf/Library/Mobile Documents/com~apple~CloudDocs/Documents/GitHub/terraform-assignment/lambda-module/password-rotate.zip")
}