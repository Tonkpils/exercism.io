FROM ruby:2.1.5

ENV APP /exercism.io/

EXPOSE 4567

WORKDIR $APP
ADD . $APP
RUN bundle install --binstubs=./bin
RUN gem install mailcatcher
