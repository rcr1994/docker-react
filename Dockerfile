FROM node:alpine as builder

WORKDIR /usr/app/
copy package.json .

RUN npm install

copy . .

RUN npm run build

FROM nginx
EXPOSE 80
copy --from=builder /usr/app/build /usr/share/nginx/html





