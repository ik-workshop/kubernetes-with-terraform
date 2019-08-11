#!/bin/bash

set -euo pipefail

COMMAND=${1:-plan}
OPTS=
[ "$COMMAND" = plan ] || OPTS=-auto-approve

./bin/helm-repositories.sh

STATE="data/state.tfstate"
MODULE="./infra/"

export TF_VAR_kube_config=${KUBECONFIG}

terraform init $MODULE

terraform $COMMAND $OPTS \
-var-file="data/params.tfvars" \
-state="$STATE" -refresh=true $MODULE

