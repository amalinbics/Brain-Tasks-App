#!/bin/bash
set -e
echo "Running BeforeInstall hook..."

# 1. Update Kubeconfig
# This command fetches the cluster authentication details and configures kubectl.
# The IAM role associated with your CodeDeploy agent needs permissions to do this.
aws eks update-kubeconfig --region ap-south-1 --name brain-tasks-cluster

# 2. Verify kubectl is connected
# It's a good practice to test the connection to ensure the next steps won't fail.
kubectl version --short

# 3. (Optional) Pre-deployment tasks
# For example, you might want to scale down an existing deployment before a blue/green deployment.
# kubectl scale deployment <deployment-name> --replicas=0

echo "BeforeInstall hook finished."