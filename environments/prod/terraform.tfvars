# Slack Channel to send integration or runtime errors to
error_channel = "#sym-errors"

flow_vars = {
  # Slack Channel where requests should go
  request_channel = "#sym-requests"

  # Optional Okta group to enable approvers authz
  approver_group = "CHANGEME"
}

# Domain of the Okta account to use for Sym integrations
okta_org_domain = "CHANGEME"

# List of targets that users can request Okta access to.
# Each item has a label and group id.
okta_targets = [
  {
    label    = "AWS Ops Admin",
    group_id = "CHANGEME" # Okta Group ID
  }
]

# Slack Workspace where Sym is installed
slack_workspace_id = "CHANGEME"

# Your org slug will be provided to you by your Sym onboarding team
sym_org_slug = "CHANGEME"

# Optionally add more tags to the AWS resources we create
tags = {
  "vendor" = "symops.com"
}
