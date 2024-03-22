#!/bin/sh

echo "checking for admin user"
output=$(flyctl ssh console --command "su - git -c '/usr/local/bin/gitea admin user list'" | grep "gitea")
if [ -z "$output" ]; then
  password=$(flyctl ssh console --command "su - git -c '/usr/local/bin/gitea admin user create --username=gitea --random-password --email=gitea@brentgruber.com --admin --must-change-password=false'" | sed -n "/generated random password is/ s/.*'\(.*\)'.*/\1/p")
  doppler secrets set GITEA_ADMIN_PASSWORD=$password >/dev/null 2>&1
  echo "Admin user gitea created"
else
    echo "Admin user already exists"
fi