#!/bin/bash

# Navigate to the directory containing the docker-compose.yml file
cd "$(dirname "$0")"

# Stop the running containers
docker compose down
