#!/bin/bash
set -e

export MONGO_URL="mongodb+srv://luanpa082:L1an1010@cluster0.n3wzlxp.mongodb.net/genieacs?retryWrites=true&w=majority"
export REDIS_URL="rediss://default:GyF7WltUj6MDZ7xo7qTg568ppJUpzW38GyF7WltUj6MDZ7xo7qTg568ppJUpzW38@redis-14320.crce207.sa-east-1-2.ec2.redns.redis-cloud.com:14320"

# Apenas o UI, usando a porta do Render
exec PORT=$PORT node ./bin/genieacs-ui
