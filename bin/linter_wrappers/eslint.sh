#!/usr/bin/env bash

CONTAINER_NAME="vim-ale-eslint"

RUNNING=$(docker inspect --format="{{.State.Running}}" ${CONTAINER_NAME} 2> /dev/null)

# if not running run the linter
if [ ! "${RUNNING}" ]; then
    exec docker run -i --rm --name "${CONTAINER_NAME}" -v $(pwd):/data dylansm/eslint-react -c /data/.eslintrc "$@"

# otherwise check the state - remove it if frozen; stop and remove if running and run again
else
  echo "Already running ${CONTAINER_NAME}. Checking if frozen...";
  if [ "$(docker ps -aq -f status=exited -f name=${CONTAINER_NAME})" ]; then
    echo "FROZEN STATE DETECTED... Removing ${CONTAINER_NAME}";
    docker rm $(docker ps -a -f name="${CONTAINER_NAME}" -q)
    echo "${CONTAINER_NAME} stopped."
  else
    docker stop $(docker ps -a -f name="${CONTAINER_NAME}" -q)
    docker rm $(docker ps -a -f name="${CONTAINER_NAME}" -q)

    exec docker run -i --rm --name "${CONTAINER_NAME}" -v $(pwd):/data dylansm/eslint-react -c /data/.eslintrc "$@"
  fi
fi

