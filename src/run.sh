#!/bin/bash

#########################################################################################################
# Wrapper to scan container vulnerabilities with Trivy (@Aquasecurity) in your GCP Project.             
# Default to scan gcr.io container registry
# REQUIRED: You must be authenticated with gcloud and have permissions to view container registry.
#########################################################################################################

# Global vars
PROJECT_ID=$1

Help()
{
   echo "**"
   echo "** @Usage: ./run.sh <PROJECT_ID>"
   echo "**"
   echo "** PROJECT_ID     (Required) Google Cloud unique Project ID."
   echo
}


if [ -z $1 ]
then
    echo "** [ERROR] Project ID not informed. "
    Help
    exit
fi

IMAGES_LIST=( $(gcloud container images list --repository=gcr.io/$PROJECT_ID | grep -v NAME) )
COUNT=0

for i in "${IMAGES_LIST[@]}"
do
    # Extract latest tag for each container image
	IMAGE_TAGS=$(gcloud container images list-tags $i | grep -v DIGEST | head -n 1 | awk '{print $2}')
    IMAGES_TO_BE_SCANNED="$i:$IMAGE_TAGS"
    echo ">> IMAGE TAGGED:  $i:$IMAGE_TAGS"

    # Scan the image filtering only CRITICAL CVEs
    trivy image --exit-code 1 --no-progress --severity CRITICAL ${i}:${IMAGE_TAGS}
    COUNT=$((COUNT+1))
done

echo "Total image(s) found: ${COUNT}"
