data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "tripradar-sqs-policy" {
  statement {
    sid    = "tripradar-sqs-statement"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    actions = [
      "sqs:SendMessage",
      "sqs:ReceiveMessage"
    ]
    resources = [
      aws_sqs_queue.tripradar-sqs-queue.arn
    ]
  }
}