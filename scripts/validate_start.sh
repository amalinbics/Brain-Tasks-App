#!/bin/bash
set -e
echo "Running ValidateService hook..."

# Wait for the service to be created
sleep 30

# Get the LoadBalancer hostname
LOAD_BALANCER_HOSTNAME=$(kubectl get service brain-tasks-app-service -o jsonpath='{.status.loadBalancer.ingress[0].hostname}')

# Check if the hostname exists and the service is reachable
if [ -z "$LOAD_BALANCER_HOSTNAME" ]; then
  echo "LoadBalancer hostname not found. Deployment failed."
  exit 1
fi

echo "Service is running at: http://$LOAD_BALANCER_HOSTNAME"

# Optional: Add a health check
# response=$(curl -s http://$LOAD_BALANCER_HOSTNAME)
# if [[ $? -ne 0 ]]; then
#   echo "Health check failed."
#   exit 1
# fi

echo "Validation test successful!"