#!/bin/sh

echo "starting runner"
echo $GITEA_ACTIONS_RUNNER_TOKEN
flyctl ssh console --command "docker run -d -e GITEA_INSTANCE_URL=https://gitea-brentgruberorg.fly.dev -e GITEA_RUNNER_REGISTRATION_TOKEN=$GITEA_ACTIONS_RUNNER_TOKEN -v /var/run/docker.sock:/var/run/docker.sock --restart always --name gitea_runner gitea/act_runner:latest"