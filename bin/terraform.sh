#!/bin/bash

set -euo pipefail

COMMAND=${1:-plan}
OPTS=
[ "$COMMAND" = plan ] || OPTS=-auto-approve

STATE="data/state.tfstate"
MODULE="./infra/"

export TF_VAR_kub_config=${KUBECONFIG}

terraform init $MODULE

# terraform $COMMAND $OPTS \
# -var-file="data/params.tfvars" \
# -state="$STATE" -refresh=true $MODULE

