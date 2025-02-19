data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "tripradar-sqs-policy" {
  statement {
    sid    = "tripradar-sqs-statement"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    actions = local.actions
    resources = [
      aws_sqs_queue.tripradar-sqs-queue.arn
    ]
  }
}

data "aws_iam_policy_document" "tripradar-sqs-dlq-policy" {
  statement {
    sid    = "tripradar-sqs-dlq-statement"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    actions = local.actions
    resources = [
      aws_sqs_queue.tripradar-sqs-dlq.arn
    ]
  }
}