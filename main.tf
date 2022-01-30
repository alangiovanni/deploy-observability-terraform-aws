# Credentials
provider "aws" {
  region     = "us-east-1"
  access_key = var.access_key_terraform
  secret_key = var.secret_key_terraform
}