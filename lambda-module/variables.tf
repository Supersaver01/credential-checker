#variable for function_name
variable "function_name" {
    description = "lambda function name"
    type        = string 
}

#variable for runtime
variable "runtime" {
    description = "runtime specification"
    type        = string 
}

#variable for iam_role
variable "iam_role_name" {
    description = "iam role name"
    type        = string 
}

#variable for iam_policy_name
variable "iam_policy_name" {
    description = "Policy that allows Lambda function to access specific resources"
    type        = string 
}

#variable for lambda_handler
variable "handler" {
    description = "description for the lambda handler"
    type        = string 
}

#variable for path to file name
variable "filename" {
    description = "specify the file path"
    type        = string 
}