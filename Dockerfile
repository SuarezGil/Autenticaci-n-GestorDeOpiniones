# Dockerfile for Node AuthService

# Use an official Node runtime as a parent image
FROM node:18-alpine

# Set working directory inside the container
WORKDIR /usr/src/app

# Copy package definitions and install dependencies
COPY package.json package-lock.json* pnpm-lock.yaml* ./

# Use the appropriate package manager if lock file exists
RUN npm install --production

# Copy the rest of the application source
COPY . .

# Expose application port (matches service configuration)
EXPOSE 3005

# Default command for development; you can override with "docker compose" command
CMD ["npm", "run", "dev"]
