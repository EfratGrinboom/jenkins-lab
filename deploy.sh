#!/bin/bash

# Prompt the user to enter the version you want to push to artifact
read -p "Enter the version you want to push to artifact: " version

# Set the image name and artifact repository image path
image_name="efrat-grinboim-jenkins-app:${version}"
artifact_registry_image="me-west1-docker.pkg.dev/devconnect-project/efrat-grinboim-artifacts/efrat-grinboim-jenkins-app:${version}"


# Authenticate with Google Cloud
gcloud auth login


#The command defines for Docker in which regen we are working
gcloud auth configure-docker me-west1-docker.pkg.dev


# Build, tag, and push the Docker image
docker build -t ${image_name} .
docker tag ${image_name} ${artifact_registry_image}
docker push ${artifact_registry_image}  