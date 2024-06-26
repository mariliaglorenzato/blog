FROM ruby:3.3.0-bullseye as base

ENV APP_HOME /blog/

WORKDIR $APP_HOME

RUN apt-get update -qq && apt-get install -y build-essential apt-utils libpq-dev

RUN gem install bundler -v 2.5.4

COPY Gemfile* $APP_HOME

RUN bundle install 

# ENTRYPOINT [ "./build/docker/docker-entrypoint.sh" ]

COPY . $APP_HOME

CMD ["/bin/sh"]
