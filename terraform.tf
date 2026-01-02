# Terraform configuration and provider settings
terraform {
  required_version = ">= 1.0"
  
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 7.0"
    }
  }
}

# Google Cloud Provider configuration
provider "google" {
  project = var.project_id
  region  = var.region
}
