locals {
  queue_name = "tripradar-sqs"
  kms_key_alias = join("/", ["alias", local.queue_name])
  kms_data_key_reuse_period_seconds = 300
}