#!/bin/bash

set -euo pipefail

namespace=jenkins

pwd=$(kubectl get secret -n $namespace jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 --decode)
user=$(kubectl get secret -n $namespace jenkins -o jsonpath="{.data.jenkins-admin-user}" | base64 --decode)
echo -e "\nJenkins Username: ${user}"
echo -e "\nJenkins Password: ${pwd}"
echo -e "\n"

PORT=8080
echo "Jenkins  \"http://localhost:${PORT}\" if not running in VM"
kubectl -n $namespace --address 0.0.0.0 port-forward svc/jenkins $PORT:8080 &
PROCESS=$!

echo -e "\npress ctrl-c to stop\n"
wait $PROCESS