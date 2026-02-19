# Docker Auto-Update Script

A lightweight Bash script to automatically update multiple Docker containers managed via `docker-compose`. This script is a simple, dependency-free alternative to tools like Watchtower, designed specifically for servers with a structured container directory.

## 🚀 How It Works
The script iterates through a base directory (e.g., `/root/containers`), enters each subdirectory, checks for a `docker-compose.yml` file, and runs the pull/up commands.

## 🛠 Installation

1. **Clone or Download** the script to your server:
  ```bash
  wget [https://raw.githubusercontent.com/YOUR_USERNAME/YOUR_REPO/main/update_containers.sh](https://raw.githubusercontent.com/YOUR_USERNAME/YOUR_REPO/main/update_containers.sh)
  ```
   
2. **Give execution permissions**:

  ```bash
  chmod +x update_containers.sh
  ```

3. **Configure the path**:
  Open the script and ensure the BASE_DIR variable points to your container folders.

## 📅 Automation (Cron Job)
To run this script automatically every Sunday at 4:00 AM, add the following line to your crontab:
  ```bash
  0 4 * * 0 /bin/bash /root/update_containers.sh >> /root/update_log.txt 2>&1
  ```

## 🧹 Features
- Auto-Pull: Fetches latest images.

- Auto-Restart: Only restarts containers if a new image is available.

- Cleanup: Runs docker image prune to keep your disk clean.

- Logging: Designed to output logs easily to a file.
