#!/bin/bash
set -e
aws eks update-kubeconfig --name brain-tasks-cluster --region ap-south-1
kubectl apply -f /tmp/deployment.yaml
kubectl apply -f /tmp/service.yaml
