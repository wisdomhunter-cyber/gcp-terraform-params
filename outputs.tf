# Output values for the Vertex AI infrastructure

output "project_id" {
  description = "GCP Project ID where resources were created"
  value       = var.project_id
}

output "region" {
  description = "GCP region where Vertex AI resources are located"
  value       = var.region
}

output "service_account_email" {
  description = "Email address of the created Vertex AI service account"
  value       = google_service_account.vertex_ai_sa.email
}

output "service_account_name" {
  description = "Name of the created Vertex AI service account"
  value       = google_service_account.vertex_ai_sa.name
}

output "service_account_key" {
  description = "Service account private key (base64 encoded) - SENSITIVE"
  value       = google_service_account_key.vertex_ai_sa_key.private_key
  sensitive   = true
}

output "vertex_ai_endpoint" {
  description = "Vertex AI API endpoint URL for the configured region"
  value       = "https://${var.region}-aiplatform.googleapis.com"
}

output "gemini_flash_model" {
  description = "Gemini Flash model identifier for use in API calls"
  value       = "gemini-1.5-flash"
}

output "enabled_apis" {
  description = "List of enabled Google Cloud APIs"
  value = [
    google_project_service.vertex_ai.service
  ]
}

output "iam_roles_granted" {
  description = "List of IAM roles granted to the service account"
  value = [
    google_project_iam_member.vertex_ai_user_role.role,
  ]
}
