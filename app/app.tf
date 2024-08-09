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
provider "hcp" {
  client_id     = var.HCP_CLIENT_ID
  client_secret = var.HCP_CLIENT_SECRET
  project_id    = var.HCP_PROJECT_ID
}

provider "tfe" {
  organization = "mattspahr-sandbox"
}

# Get Workspace
data "tfe_workspace" "workspace" {
  name         = var.tfc_workspace_name
  organization = var.tfc_organization_name
}

# Get Workspace Variables 
data "tfe_variables" "workspace_variables" {
  workspace_id = data.tfe_workspace.workspace.id
}

# Get DEMO_SECRET directly from HVS
data "hcp_vault_secrets_secret" "demo_secret" {
  app_name    = "hvs-github-demo-app"
  secret_name = "DEMO_SECRET"
}

output "hcp_vault_secrets_retrieval" {
  value     = "${data.hcp_vault_secrets_secret.demo_secret.secret_name}: ${data.hcp_vault_secrets_secret.demo_secret.secret_value}"
  sensitive = true
}
