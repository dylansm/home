#!/usr/bin/env bash

exec docker run -i --rm --name vim-ale -v $(pwd):/data dylansm/eslint-react -c /data/.eslintrc "$@"
