#!/bin/bash

DOCKER_COMPOSE_FILE=$1
DOCKER_STACK_NAME=$2
ENV_FILE=$3

# export all env vars by default from now
set -a

# source the .env.docker file and then the local .env file (e.g. .env.docker.local)
source .env.docker-compose
if [ -f "$ENV_FILE" ]; then 
    source $ENV_FILE
fi

# now the env vars are available to the "docker stack deploy" command
# and env var substitution will take place
docker stack deploy -c $DOCKER_COMPOSE_FILE $DOCKER_STACK_NAME

set +a