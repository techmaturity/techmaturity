FROM ruby:2.3-alpine

RUN apk update && \
    apk upgrade && \
    apk add --update curl-dev ruby-dev build-base bash zlib-dev libxml2-dev libxslt-dev tzdata yaml-dev postgresql-dev ruby-json yaml nodejs && \
    rm -rf /var/cache/apk/* 

RUN gem install rails --version "5.0.0"

RUN mkdir /techmaturity
ADD . /techmaturity

WORKDIR /techmaturity
RUN chmod 777 entrypoint.sh
RUN bundle install

EXPOSE 3000
CMD ["./entrypoint.sh"]