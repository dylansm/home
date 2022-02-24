#!/usr/bin/env bash

# exec docker run -i --rm -v $(pwd):/data dylansm/eslint -c /data/.eslintrc "$@"
exec docker run -i --rm -v $(pwd):/data dylansm/eslint-react -c /data/.eslintrc "$@"
