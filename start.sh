#!/bin/bash
# GenieACS start script para Render.com

# Não definir MONGO_URL nem REDIS_URL aqui, use variáveis de ambiente da Render

# Inicia todos os serviços do GenieACS
node ./bin/genieacs-cwmp &
node ./bin/genieacs-fs &
node ./bin/genieacs-nbi &
node ./bin/genieacs-ui &

# Mantém o processo principal ativo
wait
