# Vertex AI Gemini Flash Terraform Configuration

This Terraform configuration sets up a GCP project with Vertex AI enabled and creates a service account configured for calling the Gemini Flash model.

## 📁 File Structure

```
.
├── terraform.tf              # Terraform and provider configuration
├── variables.tf              # Input variable definitions
├── main.tf                   # Main resource definitions
├── outputs.tf                # Output values
├── terraform.tfvars.example  # Example variable values
├── test_gemini.py           # Python test script
├── .gitignore               # Git ignore rules
└── README.md                # Documentation
```

## 📋 File Descriptions

| File | Purpose |
|------|---------|
| `terraform.tf` | Terraform version, provider config, backend settings |
| `variables.tf` | Input variables with validation and defaults |
| `main.tf` | Resource definitions (APIs, service account, IAM) |
| `outputs.tf` | Output values after deployment |

## 🚀 Quick Start

### 1. Configure Variables

```bash
cp terraform.tfvars.example terraform.tfvars
```

Edit `terraform.tfvars`:
```hcl
project_id           = "my-gcp-project-id"
region               = "us-central1"
service_account_name = "vertex-ai-gemini-sa"
```

### 2. Deploy

```bash
terraform init
terraform plan
terraform apply
```

### 3. Get Credentials

```bash
terraform output -raw service_account_key | base64 -d > service-account-key.json
export GOOGLE_APPLICATION_CREDENTIALS="$(pwd)/service-account-key.json"
```

## 📦 Resources Created

- **APIs Enabled:** Vertex AI, IAM, Compute Engine
- **Service Account:** For Vertex AI authentication
- **IAM Roles:** `aiplatform.user` and `aiplatform.admin`
- **Service Account Key:** For authentication

## 🧪 Test Your Setup

```bash
pip install google-cloud-aiplatform
python test_gemini.py YOUR-PROJECT-ID
```

## 🗂️ Remote State (Recommended)

### Setup GCS Backend

1. Create state bucket:
```bash
gsutil mb gs://your-terraform-state-bucket
gsutil versioning set on gs://your-terraform-state-bucket
```

2. Uncomment backend block in `terraform.tf`

3. Migrate state:
```bash
terraform init -migrate-state
```

## 🔒 Security Notes

- **Never commit:** `.tfstate`, `.tfvars`, or `*.json` key files
- **Production:** Use Workload Identity Federation instead of keys
- **State:** Use remote backend with encryption
- **Review:** Always run `terraform plan` before `apply`

## 🧹 Cleanup

```bash
terraform destroy
```

## 📚 Documentation

- [Vertex AI Docs](https://cloud.google.com/vertex-ai/docs)
- [Terraform Google Provider](https://registry.terraform.io/providers/hashicorp/google/latest/docs)
- [Gemini API Reference](https://cloud.google.com/vertex-ai/docs/generative-ai/model-reference/gemini)
