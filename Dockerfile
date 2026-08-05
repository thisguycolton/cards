FROM nginx:alpine-slim

# Copy your local production web assets into Nginx webroot
COPY build/web /usr/share/nginx/html

# Custom inline Nginx config to prevent 404 errors on page refreshes
RUN echo 'server { \
  listen 80; \
  location / { \
  root /usr/share/nginx/html; \
  try_files $uri $uri/ /index.html; \
  } \
  }' > /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
