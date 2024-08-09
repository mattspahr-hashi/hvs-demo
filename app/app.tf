terraform {
  required_providers {
    hcp = {
      source  = "hashicorp/hcp"
      version = "~> 0.94.1"
    }
  }
  cloud {
    organization = "mattspahr-sandbox"
    workspaces {
      name = "hvs-demo-workspace"
    }
  }
}

provider "hcp" {}
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
  value = "${data.hcp_vault_secrets_secret.demo_secret.secret_name}: ${data.hcp_vault_secrets_secret.demo_secret.secret_value}"
}

output "tfe_variables_output" {
  value = data.tfe_variables.workspace_variables.variables
}
