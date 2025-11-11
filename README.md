pipelines
  creating the infrastructure:

  https://github.com/maormalca/devops-infra/actions/runs/17625857195

Work Description
Application (counter-service):

Terraform Infrastructure CI/CD Pipeline Overview:
This GitHub Actions workflow manages Terraform-based infrastructure with stages for static checks, planning, applying, and optional destruction.

Triggers:

Pull Requests: Runs static checks and plan verification.
Push to main: Runs Terraform apply.
Manual Dispatch: Allows triggering the destroy job (run_apply).
Environment:
AWS credentials are provided via GitHub secrets for Terraform and AWS access.

Jobs:

Static Checks: Validates Terraform syntax, checks backend configuration, and runs TFLint for best practices.
Terraform Plan: Generates a preview of changes without applying them.
Terraform Apply: Applies changes automatically on main branch pushes.
Terraform Destroy: Manual execution only, safely destroys all resources when confirmed.
Key Points:

Separation of validation, plan, apply, and destroy improves safety.
Apply is restricted to the main branch; destroy requires manual confirmation.
Backend S3 ensures safe remote state management.
