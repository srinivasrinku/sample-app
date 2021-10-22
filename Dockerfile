# Stage 1
FROM node:15.14.0-alpine3.10 as build-step
RUN mkdir -p /app
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
RUN npm run build

FROM nginx:1.17.1-alpine
COPY --from=build-step /app/dist/login-soft-exp /usr/share/nginx/html
EXPOSE 80