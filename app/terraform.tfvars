# Channel to send integration or runtime errors to
error_channel = "#sym-errors"

flow_vars = {
  request_channel = "#sym-requests" # Slack Channel where requests should go

  approver_group = "CHANGEME" # Optional Okta group to enable approvers authz
}

# Domain of the Okta account to use for this flow. Example: 'my-org.okta.com'"
okta_org_domain = "CHANGEME"

# List of targets that users can request Okta access to.
# Each item has a label and group name.
okta_targets = [
  {
    label    = "AWS Ops Admin",
    group_id = "CHANGEME" # Okta Group ID
  }
]

slack_workspace_id = "CHANGEME" # Slack Workspace where Sym is installed

sym_org_slug = "CHANGEME"

# Optionally add more tags to the AWS resources we create
tags = {
  "vendor" = "symops.com"
}
