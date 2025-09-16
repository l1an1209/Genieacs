#!/bin/bash
# start.sh corrigido para Render.com ou Linux
node ./bin/genieacs-cwmp &
node ./bin/genieacs-fs &
node ./bin/genieacs-nbi &
node ./bin/genieacs-ui &
wait
