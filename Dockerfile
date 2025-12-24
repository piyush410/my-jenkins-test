# Hum Nginx web server ka use karenge
FROM nginx:alpine

# Hamari index.html file ko Nginx ke folder mein copy karein
COPY index.html /usr/share/nginx/html/
