#Assume Role policy document
data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

#IAM policy document
data "aws_iam_policy_document" "lambda_policy" {
  statement {
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup"
    ]
    resources = [
      "arn:aws:logs:us-east-1:969036648835:*"
    ]
  }
  
    statement {
    effect = "Allow"

    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents"
	]
			
    resources = [
      "arn:aws:logs:us-east-1:969036648835:log-group:/aws/lambda/credentialChecker:*"
    ]
  }

  statement {
    effect = "Allow"

    actions = [
      "iam:ListAccessKeys",
      "iam:ListUsers",
      "iam:GetAccessKeyLastUsed",
      "iam:GetUser",
      "iam:UpdateAccessKey"
    ]
    resources = ["*"]
  }

  statement {
    effect = "Allow"

    actions = [
      "sns:Publish"
    ]
    resources = [
      "arn:aws:sns:us-east-1:969036648835:cloud-security"
    ]
  }
}
