FROM ruby:3.0.0

RUN apt-get update
RUN apt-get install --yes build-essential libpq-dev tzdata postgresql-client

ENV RAILS_ROOT /var/www/app
RUN mkdir -p $RAILS_ROOT
WORKDIR $RAILS_ROOT

ENV PORT=5000

ADD Gemfile* .

RUN gem install bundler:2.2.15 \
    && bundle install --jobs 3

ADD . .

EXPOSE $PORT

ENTRYPOINT ["./entrypoint.sh"]
