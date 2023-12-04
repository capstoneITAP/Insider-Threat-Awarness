# Use an official Node.js runtime as a base image
FROM node:16.16.0

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package.json ./

# Install the application dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Expose the port your app runs on
EXPOSE 1313

# Define the command to run your application
CMD ["npm", "start"]
