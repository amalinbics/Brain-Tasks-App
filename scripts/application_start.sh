#!/bin/bash
set -e
echo "Running ApplicationStart hook..."

# Get the ECR image URI from the CodeBuild artifact
IMAGE_URI=$(jq -r '.[0].imageUri' /tmp/codedeploy-app/imagedefinitions.json)

# Replace the image URI in the deployment YAML file
sed -i "s|<IMAGE_URI>|${IMAGE_URI}|g" /tmp/codedeploy-app/deployment.yaml

# Apply the Kubernetes manifest files
kubectl apply -f /tmp/codedeploy-app/deployment.yaml
kubectl apply -f /tmp/codedeploy-app/service.yaml

echo "Kubernetes manifests applied successfully."
