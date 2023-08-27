# Stage 1
FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run start
# Stage 2
FROM nginx:alpine
COPY --from=node /app/dist/ng /usr/share/nginx/html

EXPOSE 8080
COPY . .
CMD ["ng", "serve"]
