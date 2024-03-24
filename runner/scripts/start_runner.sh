#!/bin/sh

echo "starting runner"
# for now, loop through all machines and run start command
# would be nice if the docker start command could start the runner as well as dind
for i in $(flyctl machines list -q); do
    flyctl ssh console --command "docker run -d -e GITEA_INSTANCE_URL=https://gitea-brentgruberorg.fly.dev -e GITEA_RUNNER_REGISTRATION_TOKEN=$GITEA_ACTIONS_RUNNER_TOKEN -v /var/run/docker.sock:/var/run/docker.sock --restart always --name gitea_runner gitea/act_runner:latest"
done