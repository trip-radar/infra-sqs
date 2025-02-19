# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue
resource "aws_sqs_queue" "tripradar-sqs-queue" {
  name = local.queue_name
  delay_seconds = var.delay_seconds
  visibility_timeout_seconds = var.visibility_timeout_seconds
  max_message_size = var.max_message_size
  message_retention_seconds = var.message_retention_seconds
  receive_wait_time_seconds = var.receive_wait_time_seconds
  sqs_managed_sse_enabled = true

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.tripradar-sqs-dlq.arn
    maxReceiveCount = var.max_receive_count
  })
}

resource "aws_sqs_queue" "tripradar-sqs-dlq" {
  name = join("-", [local.queue_name, "dlq"])
  delay_seconds = var.delay_seconds_dlq
  visibility_timeout_seconds = var.visibility_timeout_seconds_dlq
  max_message_size = var.max_message_size
  message_retention_seconds = var.message_retention_seconds_dlq
  receive_wait_time_seconds = var.receive_wait_time_seconds_dlq
  sqs_managed_sse_enabled = true

}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue_policy
resource "aws_sqs_queue_policy" "tripradar-sqs-policy" {
  queue_url = aws_sqs_queue.tripradar-sqs-queue.id
  policy    = data.aws_iam_policy_document.tripradar-sqs-policy.json
}