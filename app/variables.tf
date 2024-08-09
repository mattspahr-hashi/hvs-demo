variable "tfc_organization_name" {
  default = "mattspahr-sandbox"
}

variable "tfc_workspace_name" {
  default = "hvs-demo-workspace"
}

variable "HCP_CLIENT_ID" {
  type        = string
  description = "Client ID for HCP provider"
}

variable "HCP_CLIENT_SECRET" {
  type        = string
  description = "Client Secret for HCP provider"
}
