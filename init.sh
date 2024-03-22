su - git

ATTEMPT=0
MAX_ATTEMPTS=20
while true; do
    sleep 1
    ATTEMPT=$(($ATTEMPT + 1))
    STATUS_CODE=$(curl -LI localhost:3000 -o /dev/null -w '%{http_code}\n' -s)
    if [ $STATUS_CODE = "200" ]; then
        echo "Gitea is ready"
        echo "Create Gitea admin"
        gitea admin user create -name=gitea --random-password --email=gitea@brentgruber.com --admin --must-change-password=false --access-token
        exit 0
    elif [ $ATTEMPT = $MAX_ATTEMPTS]; then
        exit 1
    fi;
done