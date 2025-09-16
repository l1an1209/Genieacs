#!/bin/bash
# GenieACS start script para Render.com

# Defina suas URLs do MongoDB e Redis com aspas simples
export MONGO_URL='mongodb+srv://luanpa082_db_user:9KZLNTmKsqxDCggj@cluster0.n3wzlxp.mongodb.net/genieacs?retryWrites=true&w=majority'
export REDIS_URL='redis://localhost:6379' # ou sua URL do Redis

# Inicia todos os serviços do GenieACS
node ./bin/genieacs-cwmp &
node ./bin/genieacs-fs &
node ./bin/genieacs-nbi &
node ./bin/genieacs-ui &

# Mantém o processo principal ativo
wait
