FROM ruby:2.1.5
MAINTAINER Leo Correa "lcorr005@gmail.com"

# Set up APP as the app directory
ENV APP /exercism.io/

EXPOSE 4567

# Skip bundle install unless Gemfile(.lock) changes
WORKDIR /tmp
ADD Gemfile /tmp/
ADD Gemfile.lock /tmp/
RUN bundle install --binstubs=./bin

WORKDIR $APP

# Place app in container
ADD . $APP
RUN echo "export DB_HOST=db" >> $APP/config/env

RUN gem install mailcatcher
