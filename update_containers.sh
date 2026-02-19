#!/bin/bash

# =================================================================             
# Project: Docker Container Auto-Updater
# Description: Iterates through subdirectories and updates Docker containers.
# =================================================================

# Base directory where container folders are located
BASE_DIR="/root/containers"

echo "--- Update Process Started: $(date) ---"

# Loop through each subdirectory in the base directory
for dir in "$BASE_DIR"/*/; do
    # Check if a docker-compose.yml file exists in the directory
    if [ -f "$dir/docker-compose.yml" ]; then
        echo ">>> Updating: ${dir}"
        cd "$dir" || continue
        
        # 1. Pull the latest images for the services
        docker compose pull
        
        # 2. Recreate containers with the new images (only if changes exist)
        docker compose up -d --remove-orphans
        
        echo ">>> ${dir} update completed."
        echo "-----------------------------------"
    fi
done

# Cleanup: Remove unused and dangling images to save disk space
echo "Cleaning up old and dangling images..."
docker image prune -f

echo "--- All containers have been processed successfully! ---"
