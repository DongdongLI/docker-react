FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .



RUN npm run build


# /app/build  <---- all the stuff built from production

FROM nginx
# beanstalk will look at this and map accordingly
EXPOSE 80

COPY --from=builder /app/build /usr/share/nginx/html
    