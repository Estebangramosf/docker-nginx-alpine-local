FROM alpine:3.10

RUN apk update && apk upgrade

RUN apk add curl \
  nginx \
  htop \
  bash \
  nano \
  git \
  apk-tools \
  gnupg \
  libxml2-dev

COPY extra_data/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /run/nginx

EXPOSE 80 443

CMD ["nginx", "-g", "pid /run/nginx/nginx.pid;daemon off;"]