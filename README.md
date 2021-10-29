# cloudbuild-trivy

Cloudbuild pipeline to scan vulnerabilities on Docker images with Trivy.

# Requirements
# Usage

# Example

- Clone this repo

```
git clone ...
```

- Update variable values in terraform.tfvars

```
project_id       = "my-project-id"
repository_name  = "my-repo-name"
repository_owner = "repository-owner"
```

- Map/Link the GitHub repository in your Cloudbuild project
```
https://console.cloud.google.com/cloud-build/triggers/connect?project=<project_number>
```

- Run Terraform to create the CloudBuild trigger

```
cd example/
terraform init
terraform apply
```

# Credits

[Trivy powered by Aquasec.](https://aquasecurity.github.io/trivy/v0.20.2/getting-started/overview/)
