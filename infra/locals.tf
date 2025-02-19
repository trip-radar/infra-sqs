locals {
  queue_name                          = "tripradar-sqs"
  state_bucket                        = "trip-radar-terraform-state"
  kms_key_alias                       = join("/", ["alias", local.queue_name])
  kms_data_key_reuse_period_seconds   = 300
}