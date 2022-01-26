locals {
  tags = merge(var.tags, {
    "SymEnv" = var.environment
  })
}

# Creates an AWS IAM Role that a Sym runtime can use for execution
module "runtime_connector" {
  source  = "terraform.symops.com/symopsio/runtime-connector/sym"
  version = ">= 1.1.0"

  account_id_safelist = var.account_id_safelist
  addons              = ["aws/secretsmgr"]
  environment         = var.environment

  tags = local.tags
}

# Stores the Okta API token, retrieved by the runtime connector for use in the
# Sym Okta integration
resource "aws_secretsmanager_secret" "okta" {
  name        = "/symops.com/${var.environment}/okta_api_token"
  description = "Okta API token for SymOps"

  tags = local.tags
}
