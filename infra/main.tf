# -----------------------------------------------
# Deploy Jenkins CI on Kubernetes cluster
# This is an example of how to use the the module
# -----------------------------------------------

module jenkins {
  source     = "git@github.com:terraform-module/terraform-helm-jenkins?ref=v0.1.0"
  namespace  = "jenkins"
  apps       = var.apps
  repository = local.repository["stable"]
}
