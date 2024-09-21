FROM node:16

# Declare build arguments
ARG BASE_URL
ARG PORT
ARG HOST

# Set environment variables
ENV BASE_URL=$BASE_URL
ENV PORT=$PORT
ENV HOST=$HOST

# The rest of your Dockerfile...
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

EXPOSE $PORT
CMD ["npm", "start"]