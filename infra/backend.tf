terraform {
  #required_version = "= 0.11.11"
  required_version = ">= 0.12"
  backend "s3" {
  encrypt = true
  bucket = "terraform-state.devops-aod-setup"
  dynamodb_table = "devops-aod-terraform-state-lock-dynamo"
  region = "ap-southeast-2"
  key = "devops-aod-terraform.state"
  }
}
