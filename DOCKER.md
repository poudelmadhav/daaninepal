# Docker Setup

## Build image
```shell
docker build -t daaninepal .
```

## Set required environment variables
```shell
export SECRET_KEY_BASE="$(rails secret)"
export DATABASE_URL="postgresql://postgres:password@localhost:5432/daaninepal_development"
```

## Run container
```shell
docker run --rm -it -p 3000:3000 --name=daaninepal-container \
  -e DATABASE_URL=$DATABASE_URL \
  -e SECRET_KEY_BASE=$RAILS_SECRET_KEY \
  daaninepal
```

## Push Docker Image to Docker Hub
```shell
docker tag daaninepal:latest paudelmadhav/daaninepal:latest
docker push paudelmadhav/daaninepal:latest
```
