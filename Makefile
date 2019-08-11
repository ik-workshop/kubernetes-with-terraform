.EXPORT_ALL_VARIABLES:

.PHONY: terraform minikube

help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

t: ## Run terraform
	@bin/terraform.sh apply

cicd: ## Proxy CICD
	@bin/show.ci.sh

start: ## Deploy Minikube Kubernetes Cluster
	@bin/minikube.sh

stop: ## Stop Minikube Kubernetes Cluster
	@minikube stop

hooks: ## Commit hooks setup
	@pre-commit install
	@pre-commit gc
	@pre-commit autoupdate