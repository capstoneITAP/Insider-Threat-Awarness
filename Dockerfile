# Use an official Node.js runtime as a base image
FROM node:18.19.0

# Set the working directory in the container
WORKDIR /app

# Set a custom npm version
ENV NPM_VERSION=10.2.3

# Copy package.json and package-lock.json to the working directory
COPY package.json ./

# Install the specified npm version
RUN npm install -g npm@${NPM_VERSION}

# Install the application dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Expose the port your app runs on
EXPOSE 1313

# Define the command to run your application
CMD ["npm", "start"]
