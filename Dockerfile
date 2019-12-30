FROM node:alphine as builder
WORKDIR '/app'
COPY package.json .
RUN npm instll
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html