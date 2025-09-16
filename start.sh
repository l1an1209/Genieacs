#!/bin/bash
# GenieACS start script para Render.com (corrigido)

# =============================
# CONFIGURAÇÃO DO BANCO DE DADOS
# =============================
# Substitua pelos seus dados do MongoDB
# Se sua senha tiver caracteres especiais, substitua @ por %40, # por %23 etc.
export MONGO_URL="mongodb+srv://luanpa082_db_user:9KZLNTmKsqxDCggj@cluster0.cvr2maj.mongodb.net/genieacs?retryWrites=true&w=majority"

# Substitua pelo seu Redis (pode ser localhost ou outro host)
export REDIS_URL="redis://localhost:6379"

# =============================
# INICIA OS SERVIÇOS DO GenieACS
# =============================
# Cada serviço roda em background (&)
node ./bin/genieacs-cwmp &
node ./bin/genieacs-fs &
node ./bin/genieacs-nbi &
node ./bin/genieacs-ui &

# =============================
# MANTÉM O SCRIPT ATIVO
# =============================
# O "wait" impede que o container feche
wait
