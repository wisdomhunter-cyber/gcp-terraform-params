# Input variables for the Vertex AI infrastructure

variable "project_id" {
  description = "The GCP project ID where resources will be created"
  type        = string

  validation {
    condition     = length(var.project_id) > 0
    error_message = "Project ID must not be empty."
  }
}

variable "region" {
  description = "The GCP region for Vertex AI resources"
  type        = string
  default     = "us-central1"
}

variable "service_account_name" {
  description = "Name (account_id) for the Vertex AI service account"
  type        = string
  default     = "vehicle-configurator1"

  validation {
    condition     = can(regex("^[a-z][a-z0-9-]{4,28}[a-z0-9]$", var.service_account_name))
    error_message = "Service account name must be 6-30 characters, start with a letter, and contain only lowercase letters, numbers, and hyphens."
  }
}
