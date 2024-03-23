#!/bin/sh

echo "starting runner"
token=$(flyctl ssh console --command "su - git -c 'docker run -e GITEA_INSTANCE_URL=https://gitea-brentgruberorg.fly.dev -e GITEA_RUNNER_TOKEN=$GITEA_ACTIONS_RUNNER_TOKEN -v /var/run/docker.sock:/var/run/docker.sock --restart always --name gitea_runner gitea/act_runner:latest'")