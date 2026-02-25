local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('iot.mraa', 'eclipse-mraa') {
  settings+: {
    description: "",
    members_can_change_project_visibility: false,
    name: "Eclipse Mraa",
    packages_containers_internal: false,
    packages_containers_public: false,
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
      default_workflow_permissions: "write",
    },
  },
  _repositories+:: [
    orgs.newRepo('mraa') {
      allow_squash_merge: false,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Linux Library for low speed IO Communication in C with bindings for C++, Python, Node.js & Java. Supports generic io platforms, as well as Intel Edison, Intel Joule, Raspberry Pi and many more.",
      homepage: "http://mraa.io",
      topics+: [
        "board",
        "communication",
        "galileo",
        "gpio",
        "i2c",
        "intel-joule",
        "io",
        "libmraa",
        "linux",
        "mraa",
        "raspberry-pi",
        "spi"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
        orgs.newRepoWebhook('https://hooks.slack.com/services/T1J561YPQ/*') {
          content_type: "json",
          events+: [
            "issue_comment",
            "pull_request",
            "push"
          ],
          secret: "********",
        },
        orgs.newRepoWebhook('http://webhook.yocto.io:9040/hooks/webhook') {
          content_type: "json",
          events+: [
            "push"
          ],
          secret: "********",
        },
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
    },
  ],
}
