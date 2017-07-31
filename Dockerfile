# use lightweight alpine version of nginx
FROM nginx:alpine

# Configure for angular fallback routes
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy app bundle to wwwroot
COPY src /usr/share/nginx/html
