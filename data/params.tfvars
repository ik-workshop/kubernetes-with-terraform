apps = {
  jenkins = {
    name          = "jenkins"
    version       = "1.5.0"
    chart         = "stable/jenkins"
    force_update  = "true"
    wait          = "false"
    recreate_pods = "true"
    deploy        = 1

    values = [<<EOF
master:
  serviceType: ClusterIP
  installPlugins:
    - kubernetes:1.18.1
    - workflow-job:2.33
    - workflow-aggregator:2.6
    - workflow-basic-steps:2.15
    - workflow-multibranch:2.21
    - credentials-binding:1.19
    - credentials:2.1.18
    - plain-credentials:1.5
    - ssh-credentials:1.16
    - git:3.11.0
    - scm-api:2.4.1
    - github:1.29.4
    - github-api:1.95
    - authentication-tokens:1.3
    - cloudbees-bitbucket-branch-source:2.4.4
    - pipeline-build-step:2.9
    - pipeline-graph-analysis:1.9
    - pipeline-input-step:2.10
    - pipeline-milestone-step:1.3.1
    - pipeline-model-api:1.3.8
    - pipeline-model-declarative-agent:1.1.1
    - pipeline-model-definition:1.3.8
    - pipeline-model-extensions:1.3.8
    - pipeline-rest-api:2.11
    - pipeline-stage-step:2.3
    - pipeline-stage-tags-metadata:1.3.8
    - pipeline-stage-view:2.11
    - pipeline-utility-steps:2.3.0
    - jackson2-api:2.9.8
    - mailer:1.23
    - display-url-api:2.3.1
    - ws-cleanup:0.37
    - pipeline-stage-step:2.3
    - script-security:1.58
    - docker-commons:1.14
    - docker-workflow:1.18
  JCasC:
    enabled: true
  sidecars:
    configAutoReload:
      enabled: true
  prometheus:
    enabled: false
persistence:
  enabled: true
  size: "4Gi"
EOF
    ]
  }
}
