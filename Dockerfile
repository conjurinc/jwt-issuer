FROM ruby:2.2.5

RUN apt-get update && \
    apt-get install -y build-essential libpq-dev

COPY app          /app/app
COPY bin          /app/bin
COPY config       /app/config
COPY db           /app/db
COPY lib          /app/lib
COPY log          /app/log
COPY public       /app/public
COPY test         /app/test
COPY tmp          /app/tmp
COPY vendor       /app
COPY config.ru    /app
COPY Gemfile      /app
COPY Gemfile.lock /app
COPY Rakefile     /app

WORKDIR /app

RUN bundle install

CMD ["/app/bin/rails", "s", "-b", "0.0.0.0"]