FROM ruby:2.7-alpine

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

RUN apk add --no-cache \
    curl-dev \
    ruby-dev \
    build-base \
    bash \
    zlib-dev \
    libxml2-dev \
    libxslt-dev \
    tzdata \
    yaml-dev \
    postgresql-dev \
    sqlite-dev \
    ruby-json \
    yaml \
    nodejs

RUN apk add --no-cache openssl ttf-dejavu && \
    wget -O /usr/local/bin/dumb-init "https://github.com/Yelp/dumb-init/releases/download/v1.2.2/dumb-init_1.2.2_x86_64" && \
    echo "37f2c1f0372a45554f1b89924fbb134fc24c3756efaedf11e07f599494e0eff9  /usr/local/bin/dumb-init" | sha256sum -c && \
    chmod +x /usr/local/bin/dumb-init

COPY Gemfile* /tmp/
WORKDIR /tmp

RUN bundle install

RUN mkdir /techmaturity
COPY . /techmaturity
WORKDIR /techmaturity

RUN chmod 777 entrypoint.sh
ENV RAILS_ENV production

EXPOSE 3000

CMD ["dumb-init", "/techmaturity/entrypoint.sh"]
