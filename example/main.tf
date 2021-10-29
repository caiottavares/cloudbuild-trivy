provider "google" {}

resource "google_cloudbuild_trigger" "run-on-schedule" {
  name        = "scan-vulnerabilities-trivy"
  description = "Build to run vuln. scan on Docker image in the pipeline."
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