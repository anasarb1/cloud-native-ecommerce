### Stage 1: Build the React application
FROM node:25-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

### Stage 2: Serve the application with Nginx
FROM nginx:stable-alpine
COPY --from=build /app/build /usr/share/nginx/html
COPY docker/frontend/nginx.conf /etc/nginx/conf.d/default.conf

# Run as a non-root user
USER nginx

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

# Health check (optional, for Kubernetes)
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD wget -q -O /dev/null http://localhost/ || exit 1


