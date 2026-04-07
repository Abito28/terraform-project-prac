resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
  alarm_name          = "high-cpu-utilazion"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 80
  alarm_actions       = [aws_sns_topic.alerts.arn]

  dimensions = {
  InstanceId = aws_instance.web.id 
}
}

resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = "my-application-health"
  dashboard_body = jsonencode({
    widgets = [{
      type = "metric"
      properties = {
        metrics = [["AWS/EC2", "CPUUtilization"]]
        period  = 300
        region  = "ap-northeast-1"
        title   = "EC2 CPU"
      }
    }]
  })
}
