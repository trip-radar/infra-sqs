resource "aws_sqs_queue_policy" "tripradar-sqs-policy" {
  queue_url = aws_sqs_queue.tripradar-sqs.id
  policy    = <<POLICY
    {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "Allow-SendMessage",
        "Effect": "Allow",
        "Principal": {
            "AWS": "${data.aws_caller_identity.current.account_id}"
        },
        "Action": [
            "sqs:DeleteMessage",
            "sqs:ReceiveMessage",
            "sqs:SendMessage",
            "sqs:GetQueueAttributes",
            "sqs:GetQueueUrl",
            "sqs:ChangeMessageVisibility",
            "sqs:ReceiveMessageWaitTimeSeconds",
            "sqs:SendMessageBatch",
            "sqs:DeleteMessageBatch",
            "sqs:ChangeMessageVisibilityBatch",
            "sqs:ListDeadLetterSourceQueues"
        ],
        "Resource": "${aws_sqs_queue.tripradar-sqs.arn}"
      }
    ]
  }
  POLICY
}

resource "aws_sqs_queue_policy" "tripradar-sqs-policy-dlq" {
  queue_url = aws_sqs_queue.tripradar-sqs-dlq.id
  policy    = <<POLICY
    {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "Allow-SendMessage",
        "Effect": "Allow",
        "Principal": {
            "AWS": "${data.aws_caller_identity.current.account_id}"
        },
        "Action": [
            "sqs:DeleteMessage",
            "sqs:ReceiveMessage",
            "sqs:SendMessage",
            "sqs:GetQueueAttributes",
            "sqs:GetQueueUrl",
            "sqs:ChangeMessageVisibility",
            "sqs:ReceiveMessageWaitTimeSeconds",
            "sqs:SendMessageBatch",
            "sqs:DeleteMessageBatch",
            "sqs:ChangeMessageVisibilityBatch",
            "sqs:ListDeadLetterSourceQueues"
        ],
        "Resource": "${aws_sqs_queue.tripradar-sqs-dlq.arn}"
      }
    ]
  }
  POLICY
}