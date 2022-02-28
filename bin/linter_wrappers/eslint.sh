#!/usr/bin/env bash

CONTAINER_NAME="vim-ale-eslint"

# [ ! "$(docker ps -a | ${CONTAINER_NAME})" ] && exec # ...

RUNNING=$(docker inspect --format="{{.State.Running}}" ${CONTAINER_NAME} 2> /dev/null)

if [ ! "${RUNNING}" ]; then
    # echo "it is running"
        # # cleanup if stuck
        # echo "I see ${CONTAINER_NAME}"
    # fi

    exec docker run -i --rm --name "${CONTAINER_NAME}" -v $(pwd):/data dylansm/eslint-react -c /data/.eslintrc "$@"
else
  if [ "$(docker ps -aq -f status=exited -f name=${CONTAINER_NAME})" ]; then
    docker rm "${CONTAINER_NAME}"
    exec docker run -i --rm --name "${CONTAINER_NAME}" -v $(pwd):/data dylansm/eslint-react -c /data/.eslintrc "$@"
  fi
fi

