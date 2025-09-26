#!/bin/bash

# Navigate to the directory containing the docker-compose.yml file
cd "$(dirname "$0")"

# Pull the latest images and start the containers
docker compose pull && docker compose up
