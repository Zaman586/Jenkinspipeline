# Use a lightweight web server image
FROM nginx:alpine

# Copy your HTML file to the web server
COPY index.html /usr/share/nginx/html/

# Expose the web server port
EXPOSE 80
