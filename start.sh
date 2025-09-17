#!/bin/bash
# GenieACS start script para Linux/Render

# Defina suas URLs do MongoDB e Redis
export MONGO_URL="mongodb+srv://luanpa082:L1an1010@cluster0.n3wzlxp.mongodb.net/genieacs?retryWrites=true&w=majority"
export REDIS_URL="redis://localhost:6379" # ou sua URL do Redis



node ./bin/genieacs-cwmp &> logs/cwmp.log &
node ./bin/genieacs-fs &> logs/fs.log &
node ./bin/genieacs-nbi &> logs/nbi.log &
node ./bin/genieacs-ui &> logs/ui.log &

wait
