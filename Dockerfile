FROM node:18-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
  python3 \
  build-essential \
  && rm -rf /var/lib/apt/lists/*

# Create app directory
WORKDIR /app

# Install n8n globally
RUN npm install -g n8n

# Copy configuration files
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=admin123

ENV DB_TYPE=postgresdb
ENV DB_POSTGRESDB_HOST=db.luirtfmbdfshflnkfqng.supabase.co
ENV DB_POSTGRESDB_PORT=5432
ENV DB_POSTGRESDB_DATABASE=postgres
ENV DB_POSTGRESDB_USER=postgres
ENV DB_POSTGRESDB_PASSWORD=Duffy@215092

ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https
ENV WEBHOOK_URL=https://suman.fly.dev
ENV NODE_OPTIONS=--dns-result-order=ipv4first

EXPOSE 5678
CMD ["n8n"]