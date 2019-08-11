# ================= #
# HELM Repositories #
# ================= #

data helm_repository stable {
  name = "stable"
  url  = var.helm_repositories["stable"]
}

data helm_repository incubator {
  name = "incubator"
  url  = var.helm_repositories["incubator"]
}

locals {
  repository = {
    stable    = data.helm_repository.stable.metadata.0.name
    incubator = data.helm_repository.incubator.metadata.0.name
  }
}