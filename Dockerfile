# Use an official Node.js runtime as a parent image
FROM node:20-alpine

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to install dependencies
# This step is done separately to leverage Docker's caching
COPY package*.json ./

# Install application dependencies
RUN npm install

# Copy the rest of the application source code
COPY . .

# Expose the port your application listens on
EXPOSE 3000

# Define the command to run your application when the container starts
CMD ["node", "server.js"]
