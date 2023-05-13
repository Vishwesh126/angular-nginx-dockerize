# Stage 1 - for building the angular app
FROM node:alpine3.17 as angularApp
RUN mkdir -p /app/vish-app
WORKDIR vish-app
ADD . .
RUN npm install && npm run build

# Stage 2 - to copy files to nginx html folder and start the front service
FROM nginx
COPY --from=angularApp /app/vish-app/dist/* /usr/share/nginx/html/
EXPOSE 80
