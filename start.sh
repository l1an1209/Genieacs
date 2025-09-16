#!/bin/bash
# GenieACS start script para Render.com / Windows Git Bash

# Ajusta PATH para garantir que o Node seja encontrado
export PATH="/c/Program Files/nodejs:$PATH"

# Defina suas URLs do MongoDB e Redis
export MONGO_URL="mongodb+srv://luanpa082:L1an1010%40@cluster0.n3wzlxp.mongodb.net/genieacs?retryWrites=true&w=majority"
export REDIS_URL="redis://127.0.0.1:6379"  # ou sua URL do Redis real

# Inicia todos os serviços do GenieACS
node ./bin/genieacs-cwmp &
node ./bin/genieacs-fs &
node ./bin/genieacs-nbi &
node ./bin/genieacs-ui &

# Mantém o processo principal ativo
wait
