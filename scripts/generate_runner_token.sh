#!/bin/sh

echo "generating token"
token=$(flyctl ssh console --command "su - git -c '/usr/local/bin/gitea actions generate-runner-token'")
doppler secrets set GITEA_ACTIONS_RUNNER_TOKEN=$password >/dev/null 2>&1 # ignore output