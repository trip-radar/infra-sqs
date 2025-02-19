provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = local.state_bucket
    key    = "infra-cognito/infra/environments/${var.environment}/variables.tfstate"
    region = var.region
  }
}
