# Main resource definitions for Vertex AI setup

# Enable required Google Cloud APIs
resource "google_project_service" "vertex_ai" {
  project = var.project_id
  service = "aiplatform.googleapis.com"
  disable_on_destroy = false
}

# Create service account for Vertex AI operations
resource "google_service_account" "vertex_ai_sa" {
  account_id   = var.service_account_name
  display_name = "Vertex AI Gemini Service Account"
  description  = "Service account for calling Gemini Flash model via Vertex AI"
  project      = var.project_id

}

# Grant Vertex AI User role to the service account
resource "google_project_iam_member" "vertex_ai_user_role" {
  project = var.project_id
  role    = "roles/aiplatform.user"
  member  = "serviceAccount:${google_service_account.vertex_ai_sa.email}"
  depends_on = [google_service_account.vertex_ai_sa]
}

# Create service account key for authentication
# WARNING: This stores sensitive credentials in state file
resource "google_service_account_key" "vertex_ai_sa_key" {
  service_account_id = google_service_account.vertex_ai_sa.name
}
