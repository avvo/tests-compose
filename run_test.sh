#!/bin/sh

set -e

FILE=$1
if [ -z "${FILE}" ]
then
  echo "Missing docker-compose.yml file"
  exit 1
fi

docker-compose -f ${FILE} up --abort-on-container-exit
test `docker-compose -f ${FILE} ps -q | xargs docker inspect -f '{{ .State.ExitCode }}' | grep -c -v 0` -eq 0
