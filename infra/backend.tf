resource "aws_s3_bucket" "terraform-state" {
  bucket = "terraform-state.devops-aod-setup"
  acl    = "private"
  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
      }
    }
  }

  lifecycle {
    prevent_destroy = true
  }
}

terraform {
  #required_version = "= 0.11.11"
  required_version = ">= 0.12"
  backend "s3" {
  encrypt = true
  bucket = "terraform-state.devops-aod-setup"
  dynamodb_table = "devops-aod-terraform-state-lock-dynamo"
  region = "ap-southeast-1"
  key = "devops-aod-terraform.state"
  }
}
