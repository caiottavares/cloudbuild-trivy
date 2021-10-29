# cloudbuild-trivy

Cloudbuild pipeline to scan vulnerabilities on Docker images with Trivy.

# Requirements

| Tool              |  Link/HowTo					   			  |
| ----------------- |:-------------------------------------------:| 
| Terraform CLI   	| [terraform.io/downloads.html](https://terraform.io/downloads.html)      		      |
| Git			    | yum install git   				       	  | 
| Google Cloud SDK  | [cloud.google.com/sdk/docs/install](https://cloud.google.com/sdk/docs/install)      	  |

# Usage

1) Add the steps to run Trivy scan in your Cloudbuild pipeline. Full example is shown below.
2) Passive scanning on already existing Docker images. If you would like to scan already existing images in a project, run the bash script as described below:

- Clone this repo

```
git clone git@github.com:caiotavaresdito/cloudbuild-trivy.git
```

- Run bash script

**Note:** This script will scan ALL images stored in the gcr.io registry in a project. 

```
./src/run.sh <my-project-id>
```


# Example

- Clone this repo

```
git clone git@github.com:caiotavaresdito/cloudbuild-trivy.git
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

- Commit a change in the repo & open a pull request on GitHub:

![Build preview](img/build_preview.jpeg "Build preview")

# Credits

[Trivy powered by Aquasec.](https://aquasecurity.github.io/trivy/v0.20.2/getting-started/overview/)
