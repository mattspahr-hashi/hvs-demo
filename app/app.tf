terraform {
  cloud {
    organization = "mattspahr-sandbox"
    workspaces {
      name = "hvs-demo-workspace"
    }
  }
}

provider "random" {}

resource "random_string" "random" {
  length  = 15
  special = true
}
output "random_string" {
  value = random_string.random.result
}
