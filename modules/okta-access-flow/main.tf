# The Flow that grants users access to Okta targets.
resource "sym_flow" "this" {
  name  = local.flow_name
  label = local.flow_label

  template = "sym:template:approval:1.0.0"

  implementation = "${path.module}/impl.py"

  environment_id = var.sym_environment.id

  vars = var.flow_vars

  params = {
    strategy_id = sym_strategy.this.id

    prompt_fields_json = jsonencode(
      [
        {
          name     = "reason"
          type     = "string"
          required = true
        }
      ]
    )
  }
}

# The Strategy your Flow uses to manage target Okta groups.
resource "sym_strategy" "this" {
  type = "okta"

  name           = local.flow_name
  integration_id = sym_integration.okta.id
  targets        = [for target in sym_target.targets : target.id]
}

# The target Okta groups that your Sym Strategy manages access to.
resource "sym_target" "targets" {
  for_each = local.targets

  type = "okta_group"

  name  = each.key
  label = each.value["label"]

  settings = {
    group_id = each.value["group_id"]
  }
}

# The Okta API Key that enables your Okta Sym Integration to work.
resource "sym_secret" "okta_api_key" {
  path      = var.secrets_settings.path
  source_id = var.secrets_settings.source_id

  settings = {
    json_key = var.secret_json_key
  }
}

# The Okta Integration that your Sym Strategy uses to manage your Okta targets.
resource "sym_integration" "okta" {
  type        = "okta"
  name        = local.flow_name
  external_id = var.okta_org_domain

  settings = {
    api_token_secret = sym_secret.okta_api_key.id
  }
}

locals {
  flow_suffix  = var.sym_environment.name == "prod" ? "" : "_${var.sym_environment.name}"
  label_suffix = var.sym_environment.name == "prod" ? "" : " [${var.sym_environment.name}]"

  flow_name  = "okta${local.flow_suffix}"
  flow_label = "Okta${local.label_suffix}"

  targets = {
    for target in var.targets :
    format("%s-%s", local.flow_name, target["group_id"]) => target
  }
}
