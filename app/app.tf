terraform {
  required_providers {
    hcp = {
      source  = "hashicorp/hcp"
      version = "0.91.0"
    }
  }
  cloud {
    organization = "mattspahr-sandbox"
    workspaces {
      name = "hvs-demo-workspace"
    }
  }
}

provider "random" {}

provider "hcp" {
  client_id     = var.HCP_CLIENT_ID
  client_secret = var.HCP_CLIENT_SECRET
  project_id    = var.HCP_PROJECT_ID
}

provider "tfe" {
  organization = "mattspahr-sandbox"
}

# Random String
resource "random_string" "random_string" {
  length = 15
}

# Get STRIPE_API_KEY directly from HVS
data "hcp_vault_secrets_secret" "demo_secret" {
  app_name    = "retrieval-app"
  secret_name = "STRIPE_API_KEY"
}

output "database_username" {
  value     = var.DATABASE_USERNAME
  sensitive = true
}

output "database_password" {
  value     = var.DATABASE_PASSWORD
  sensitive = true
}

output "stripe_api_key" {
  value     = data.hcp_vault_secrets_secret.demo_secret.secret_value
  sensitive = true
}
