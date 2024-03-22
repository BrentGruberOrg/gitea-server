
# flyctl auth

```
flyctl auth login
```

# create app

```
flyctl launch --name gitea-brentgruberorg --image gitea/gitea --org brentgruberorg --no-deploy
```

This will generate the fly.toml which needs to be edited to what's currently in this repo

# create volume for storage

Gitea will use sqlite natively, fly.io supports 3GB persistent volume storage

```
flyctl volumes create gitea_data --size 3 --app brentgruberorg-gitea
```

# login

```
fly ssh console
```