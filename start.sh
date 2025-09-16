#!/bin/bash
# GenieACS start script for Render.com

# Configure MongoDB URL
export MONGO_URL="mongodb+srv://luanpa082_db_user:L1an1010@cluster0.n3wzlxp.mongodb.net/genieacs?retryWrites=true&w=majority"

# Configure Redis URL if needed
export REDIS_URL="redis://localhost:6379"

# Start GenieACS services
node ./bin/genieacs-cwmp &
node ./bin/genieacs-fs &
node ./bin/genieacs-nbi &
node ./bin/genieacs-ui &

# Keep the main process alive
wait
