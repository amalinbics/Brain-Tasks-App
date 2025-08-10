#!/bin/bash
set -e
IMAGE_URI=$(cat imagedefinitions.json | jq -r '.[0].imageUri')
sed -i "s|<IMAGE_URI>|$IMAGE_URI|g" /tmp/deployment.yaml
