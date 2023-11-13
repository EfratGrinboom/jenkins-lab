#!/bin/bash

# Replace with your own values
INSTANCE_NAME="efratgrinboim-jenkins"
PROJECT_ID="devconnect-project"
REGION="me-west1"
ZONE="me-west1-a"
REPOSITORY=" efratgrinboim-jenkins-app"
IMAGE=" 96854dbc345b"


# Prompt the user for the Docker image tag
read -p "Enter the Docker image tag: " TAG

# Check if the tag is not empty
if [ -z "$TAG" ]; then
    echo "Image tag cannot be empty. Exiting."
    exit 1

# Connect to the Compute Engine instance using SSH
ssh shifraefrat@34.0.72.214
gcloud compute ssh shifraefrat@$INSTANCE_NAME --project $PROJECT_ID --zone $ZONE --command "docker volume create chat-app-data; docker pull "me-west1-docker.pkg.dev/$PROJECT_ID/$REPOSITORY/$IMAGE:$TAG"; docker run -p 8080:5000 "me-west1-docker.pkg.dev/$PROJECT_ID/$REPOSITORY/$IMAGE:$TAG";"

gcloud compute ssh --zone "me-west1-a" "gke-efratgrinboim-clus-devconnect-app-de0e9fbf-wtxl" --project "devconnect-project"




# Commands to run on the remote instance

# Pull the Docker image from Artifact Registry
# docker pull "me-west1-docker.pkg.dev/$PROJECT_ID/$REPOSITORY/$IMAGE:$TAG"

# Run the Docker container from the pulled image
# docker run -p 8080:5000 "me-west1-docker.pkg.dev/$PROJECT_ID/$REPOSITORY/$IMAGE:$TAG"
# EOF

# gcloud compute ssh shifraefrat@efrat-first-instance --project grunitech-mid-project --zone me-west1-a 
# gcloud auth configure-docker me-west1-docker.pkg.dev

# docker pull "me-west1-docker.pkg.dev/grunitech-mid-project/efrat-chat-app-images/test:0.0.3"
# docker run -p 8080:5000 "me-west1-docker.pkg.dev/grunitech-mid-project/efrat-chat-app-images/test:0.0.3"


# gcloud projects add-iam-policy-binding grunitech-mid-project \
#   --member=serviceAccount:my-service-account@grunitech-mid-project.iam.gserviceaccount.com \
#   --role=roles/artifactregistry.reader