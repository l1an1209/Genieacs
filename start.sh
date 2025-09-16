#!/bin/bash
# GenieACS start script cross-platform (Windows/Linux/Render.com)

# --- CONFIGURAÇÃO DAS VARIÁVEIS DE AMBIENTE ---
# Coloque sua URL real do MongoDB (sem < >)
export MONGO_URL='mongodb+srv://luanpa082_db_user:9KZLNTmKsqxDCggj@cluster0.n3wzlxp.mongodb.net/genieacs?retryWrites=true&w=majority'

# Coloque a URL do Redis (ajuste se estiver usando outro host)
export REDIS_URL='redis://localhost:6379'

# --- CAMINHO DO NODE ---
# Detecta o sistema operacional
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
    # Windows Git Bash
    NODE_PATH="/c/Program Files/nodejs/node.exe"
else
    # Linux / Render.com
    NODE_PATH="node"
fi

# --- INICIA OS SERVIÇOS DO GENIEACS ---
"$NODE_PATH" ./bin/genieacs-cwmp &
"$NODE_PATH" ./bin/genieacs-fs &
"$NODE_PATH" ./bin/genieacs-nbi &
"$NODE_PATH" ./bin/genieacs-ui &

# Mantém o processo principal ativo
wait
