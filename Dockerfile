FROM node:14.16.0 as build
WORKDIR /app
COPY . /app
RUN yarn
RUN yarn build-prod

FROM nginx
WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY --from=build /app/dist/angular-i18n-example /usr/share/nginx/html
EXPOSE 80
