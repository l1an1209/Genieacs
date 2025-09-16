#!/bin/bash
PORT=${PORT:-3000}

echo "Iniciando GenieACS..."

node ./bin/genieacs-cwmp &
node ./bin/genieacs-fs &
node ./bin/genieacs-nbi &
node ./bin/genieacs-ui --port $PORT &

wait
