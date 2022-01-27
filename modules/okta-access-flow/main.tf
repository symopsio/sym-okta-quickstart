locals {
  flow_name = "okta_access"
}

# A sym_flow declares a workflow that controls how users can access some group
# of access targets.
resource "sym_flow" "this" {
  name   = local.flow_name
  labela = "Okta Access"

  template = "sym:template:approval:1.0.0"

  implementation = "${path.module}/impl.py"

  environment_id = var.sym_environment_id

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

# A sym_strategy declares a list of targets, and a way of granting access to
# those targets.
resource "sym_strategy" "this" {
  type = "okta"

  name           = local.flow_name
  integration_id = var.okta_integration_id
  targets        = [for target in var.targets : sym_target.targets[target["group_id"]].id]
}

# A sym_target declares something that users can request access to.
resource "sym_target" "targets" {
  for_each = { for target in var.targets : target["group_id"] => target["label"] }

  type = "okta_group"

  name  = "${local.flow_name}-${each.key}"
  label = each.value

  settings = {
    group_id = each.key
  }
}

