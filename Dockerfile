# Use the official Node.js image as a base
FROM node:14

# Create and set the working directory
WORKDIR /usr/src/app

# Create a package.json file for dependencies
COPY package.json ./

# Install dependencies
RUN npm install

# Copy the app's source code into the container
COPY . .

# Expose port 3232 (or whatever port you choose)
EXPOSE 3232

# Command to start the app (a simple server in this case)
CMD ["node", "server.js"]
