#!/bin/bash

PORT=${PORT:-10000}

echo "Iniciando GenieACS..."

# CWMP (TR-069)
node ./bin/genieacs-cwmp &

# File Server
node ./bin/genieacs-fs &

# NBI (API)
node ./bin/genieacs-nbi &

# UI (forçar porta do Render)
node ./bin/genieacs-ui --port $PORT &

wait
