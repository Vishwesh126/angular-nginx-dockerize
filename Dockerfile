# Stage 1 - for building the angular app
FROM node:17 as angularApp
RUN mkdir -p /app
WORKDIR /app
RUN git clone 
RUN mv angular-nginx-docker vish-app
WORKDIR vish-app
RUN npm install && npm run build

# Stage 2 - to copy files to nginx html folder and start the front service
FROM nginx
COPY --from=angularApp /app/vish-app/dist/* /usr/share/nginx/html/
EXPOSE 80