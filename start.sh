#!/bin/bash
set -e

# ===============================
# CONFIGURAÇÃO DE VARIÁVEIS
# ===============================

# MongoDB
export MONGO_URL="mongodb+srv://luanpa082:L1an1010@cluster0.n3wzlxp.mongodb.net/genieacs?retryWrites=true&w=majority"

# Redis (senha atualizada)
export REDIS_URL="rediss://default:GyF7WltUj6MDZ7xo7qTg568ppJUpzW38GyF7WltUj6MDZ7xo7qTg568ppJUpzW38@redis-14320.crce207.sa-east-1-2.ec2.redns.redis-cloud.com:14320"

# Porta opcional para o UI
PORT=${PORT:-3000}

# ===============================
# INICIAR MÓDULOS DO GENIEACS
# ===============================

echo "Iniciando GenieACS CWMP..."
node ./bin/genieacs-cwmp &

echo "Iniciando GenieACS File Server..."
node ./bin/genieacs-fs &

echo "Iniciando GenieACS NBI (API)..."
node ./bin/genieacs-nbi &

echo "Iniciando GenieACS UI na porta $PORT..."
exec node ./bin/genieacs-ui
