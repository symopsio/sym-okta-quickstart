connector_environment = "jbass-local-sym"

# Slack Channel to send integration or runtime errors to
error_channel = "#sym-errors"

flow_vars = {
  request_channel = "#access-requests" # Slack Channel where requests should go

  approver_group = "00get1vg7LQbeWjJG4x6" # Optional Okta group to enable approvers authz
}

# Domain of the Okta account to use Sym for integrations
okta_org_domain = "dev-291131.okta.com"

# List of targets that users can request Okta access to.
# Each item has a label and group id.
okta_targets = [
  {
    label    = "Prod", # SymProd
    group_id = "00g5nobejxMzQC5Uf4x7"
  }
]

slack_workspace_id = "T02MY1051HS" # Slack Workspace where Sym is installed

# Your org slug will be provided to you by your Sym onboarding team
sym_org_slug = "sym"

# Optionally add more tags to the AWS resources we create
tags = {
  "vendor" = "symops.com"
}
