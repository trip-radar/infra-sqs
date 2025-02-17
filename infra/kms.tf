resource "aws_kms_alias" "tripradar-kms-alias" {
    name = local.kms_key_alias
    target_key_id = aws_kms_key.tripradar-kms-key.key_id
  
}

resource "aws_kms_key" "tripradar-kms-key" {
    description = "Chave de criptografia para o SQS do TripRadar"
    deletion_window_in_days = 10
    enable_key_rotation = true
    policy = <<POLICY
        {
            "Version": "2012-10-17",
            "Statement": [
                {
                    "Sid": "Permitir administração da chave",
                    "Effect": "Allow",
                    "Principal": {
                        "AWS": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
                    },
                    "Action": [
                        "kms:*"
                    ],
                    "Resource": "*",
                    "Condition": {
                        "StringEquals": {
                            "kms:CallerAccount": "${data.aws_caller_identity.current.account_id}"
                        }
                    }
                },
                {
                    "Sid": "Permitir administração da chave",
                    "Effect": "Allow",
                    "Principal": {
                        "AWS": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
                    },
                    "Action": [
                        "kms:Encrypt",
                        "kms:Decrypt",
                        "kms:ReEncrypt*",
                        "kms:GenerateDataKey*",
                        "kms:DescribeKey"
                    ],
                    "Resource": "*"
                },
                {
                    "Sid": "Permitir administração da chave",
                    "Effect": "Allow",
                    "Principal": {
                        "AWS": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
                    },
                    "Action": [
                        "kms:CreateGrant",
                        "kms:ListGrants",
                        "kms:RevokeGrant"
                    ],
                    "Resource": "*"
                },
                {
                    "Sid": "Permitir acesso a recursos SQS",
                    "Effect": "Allow",
                    "Principal": {
                        "Service": "sqs.amazonws.com"
                    },
                    "Action": [
                        "kms:GenerateDataKey",
                        "kms:Decrypt"
                    ],
                    "Resource": "*"
                }
            ]
        }
    POLICY
}