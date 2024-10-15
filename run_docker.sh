#!/bin/bash

# Step 1: Build the Docker image
docker build -t my-nginx-app .

# Step 2: Run the Docker container on a different port, e.g., 8081
docker run -d -p 8081:80 my-nginx-app

# Step 3: Show the running container (optional)
docker ps

# Step 4: Output the IP where the server is running
echo "The web server is running. Access it at http://localhost:8081"
