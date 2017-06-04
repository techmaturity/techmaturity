FROM ruby:2.3-alpine

RUN apk update && \
    apk upgrade && \
    apk add --update curl-dev ruby-dev build-base bash zlib-dev libxml2-dev libxslt-dev tzdata yaml-dev postgresql-dev sqlite-dev ruby-json yaml nodejs && \
    rm -rf /var/cache/apk/* 

RUN apk --update add openssl ttf-dejavu && rm -rf /var/cache/apk/* && \
    wget -O /usr/local/bin/dumb-init "https://github.com/Yelp/dumb-init/releases/download/v1.0.1/dumb-init_1.0.1_amd64" && \
    echo "91b9970e6a0d23d7aedf3321fb1d161937e7f5e6ff38c51a8a997278cc00fb0a  /usr/local/bin/dumb-init" | sha256sum -c && \
    chmod +x /usr/local/bin/dumb-init

RUN gem install rails --version "5.1.0"

RUN mkdir /techmaturity
ADD . /techmaturity
WORKDIR /techmaturity

RUN chmod 777 entrypoint.sh
ENV RAILS_ENV production
RUN bundle install

EXPOSE 3000

CMD ["dumb-init", "/techmaturity/entrypoint.sh"]