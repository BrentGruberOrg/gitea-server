#!/bin/sh

echo "checking for admin user"
output=$(flyctl ssh console --command "su - git -c '/usr/local/bin/gitea admin user list'" | grep "gitea")
if [ -z "$output" ]; then
  user_output=$(flyctl ssh console --command "su - git -c '/usr/local/bin/gitea admin user create --username=gitea --random-password --email=gitea@brentgruber.com --admin --must-change-password=false --access-token'") 
  password=$(echo $user_output | sed -n "s/generated random password is '\([^']*\)'.*/\1/p")
  access_token=$(echo $user_output | sed -n -e 's/^.*Access token was successfully created... \([^ ]*\).*$/\1/p')
  doppler secrets set GITEA_ADMIN_USER=gitea >/dev/null 2>&1 # ignore output
  doppler secrets set GITEA_ADMIN_PASSWORD=$password >/dev/null 2>&1 #ignore output
  doppler secrets set GITEA_ADMIN_ACCESS_TOKEN=$access_token >/dev/null 2>&1 #ignore output
  echo "Admin user gitea created"
else
    echo "Admin user already exists"
fi