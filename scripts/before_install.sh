#!/bin/bash
set -e
echo "Running BeforeInstall hook..."
aws eks update-kubeconfig --region ap-south-1 --name brain-tasks-cluster
echo "BeforeInstall hook finished."