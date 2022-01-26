provider "aws" {
  region = var.aws_region
}

provider "sym" {
  org = var.sym_org_slug
}

# Defines Sym dependencies in AWS
module "sym_connectors" {
  source = "../modules/sym-connectors"

  tags = var.tags
}

# Defines Sym shared integrations
module "sym_shared" {
  source = "../modules/sym-shared"

  error_logger_prod  = var.error_channel
  okta_org_domain    = var.okta_org_domain
  runtime_settings   = module.sym_connectors.runtime_settings
  slack_workspace_id = var.slack_workspace_id
}

# Okta Access flow
module "okta_access_flow" {
  source = "../modules/okta-access-flow"

  flow_vars           = var.flow_vars
  okta_integration_id = module.sym_shared.okta_integration_id
  sym_environment_id  = module.sym_shared.prod_environment_id
  targets             = var.okta_targets
}
