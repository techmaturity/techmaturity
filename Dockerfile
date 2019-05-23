FROM ruby:2.5-alpine

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
    wget -O /usr/local/bin/dumb-init "https://github.com/Yelp/dumb-init/releases/download/v1.2.1/dumb-init_1.2.1_amd64" && \
    echo "057ecd4ac1d3c3be31f82fc0848bf77b1326a975b4f8423fe31607205a0fe945  /usr/local/bin/dumb-init" | sha256sum -c && \
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
