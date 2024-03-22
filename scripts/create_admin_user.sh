#!/bin/bash

output=flyctl ssh console --command "su - git -c '/usr/local/bin/gitea admin user list'" | grep "gitea"
if [ -z "$output" ]; then
  password=flyctl ssh console --command "su - git -c '/usr/local/bin/gitea admin user create --username admin --password admin --email
  doppler secrets set GITEA_ADMIN_PASSWORD=$password >/dev/null 2>&1
else
    echo "Admin user already exists"
fi