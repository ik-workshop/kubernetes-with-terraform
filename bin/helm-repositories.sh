#!/bin/bash

set -euo pipefail

helm init --client-only
helm repo update

