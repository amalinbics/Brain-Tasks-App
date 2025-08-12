#!/bin/bash
echo "Running AfterInstall hook..."
# This hook can be used for things like cleanup or further configuration.
# For example, you might remove old deployment files.
 rm -rf /tmp/codedeploy-app

echo "AfterInstall hook finished."s