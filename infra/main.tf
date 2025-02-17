resource "aws_sqs_queue" "tripradar-sqs" {
  name = local.queue_name
  delay_seconds = var.delay_seconds
  message_retention_seconds = var.message_retention_seconds
  receive_wait_time_seconds = var.receive_wait_time_seconds
  visibility_timeout_seconds = var.visibility_timeout_seconds
  max_message_size = var.max_message_size
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.tripradar-sqs-dlq.arn
    maxReceiveCount = var.max_receive_count
  })
  kms_master_key_id = aws_kms_alias.tripradar-kms-key.arn
  kms_data_key_reuse_period_seconds = local.kms_data_key_reuse_period_seconds

}

resource "aws_sqs_queue" "tripradar-sqs-dlq" {
  name = join("-", [local.queue_name, "dlq"])
  delay_seconds = var.delay_seconds_dlq
  message_retention_seconds = var.message_retention_seconds_dlq
  receive_wait_time_seconds = var.receive_wait_time_seconds_dlq
  visibility_timeout_seconds = var.visibility_timeout_seconds_dlq
  max_message_size = var.max_message_size
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.tripradar-sqs-dlq.arn
    maxReceiveCount = var.max_receive_count
  })
  kms_master_key_id = aws_kms_alias.tripradar-kms-key.arn
  kms_data_key_reuse_period_seconds = local.kms_data_key_reuse_period_seconds

}