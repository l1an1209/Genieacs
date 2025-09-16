#!/bin/bash

# URLs do MongoDB e Redis
export MONGO_URL="mongodb+srv://luanpa082:L1an1010%40@cluster0.n3wzlxp.mongodb.net/genieacs?retryWrites=true&w=majority"
export REDIS_URL="redis://localhost:6379"

# Inicia todos os serviços do GenieACS
node ./bin/genieacs-cwmp &
node ./bin/genieacs-fs &
node ./bin/genieacs-nbi &
node ./bin/genieacs-ui &

# Mantém o processo principal ativo
wait
