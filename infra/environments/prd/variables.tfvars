region                = "sa-east-1"
environment           = "prd"
state_bucket          = "trip-radar-terraform-state"
nlb_endpoint          = "http://my-nlb-prd-1234567890.elb.amazonaws.com"
cognito_user_pool_name = "my-dev-user-pool"
subnet_ids            = ["subnet-0abcdef1234567890", "subnet-0987654321fedcba0"]
security_group_ids    = ["sg-0abcdef1234567890"]