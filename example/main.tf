provider "google" {}

resource "google_cloudbuild_trigger" "run-on-schedule" {
  name        = "scan-vulnerabilities-trivy"
  description = "Scheduled build to run vuln. scan on all container images of the project."
  project     = var.project_id
  filename    = "example/cloudbuild.scan.yaml"

  github {
    owner = var.repository_owner
    name  = var.repository_name
    pull_request {
      branch          = ".*"
      comment_control = "COMMENTS_ENABLED_FOR_EXTERNAL_CONTRIBUTORS_ONLY"
    }

  }
}