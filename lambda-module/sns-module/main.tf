resource "aws_sns_topic" "credential_rotation_alerts" {
  name = var.topic_name
}

#Create SNS subscription for email notifications
resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.credential_rotation_alerts.arn
  protocol  = "email"
  endpoint  = var.notification_email
}
