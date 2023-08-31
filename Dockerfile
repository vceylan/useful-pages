# development-stage
FROM node:lts-alpine as development-stage

# bind your app to the gateway IP
ENV HOST=0.0.0.0

# make the 'app' folder the current working directory
WORKDIR /app

# copy project files and folders to the current working directory (i.e. 'app' folder)
COPY . .

# install project dependencies
RUN npm install

EXPOSE 5173

# build-stage
FROM development-stage as build-stage
RUN npm run build