FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs unixodbc-dev
RUN mkdir /app
WORKDIR /app
ADD ./Gemfile /app
ADD ./Gemfile.lock /app
RUN bundle install
ADD . /app
RUN mkdir -p tmp/sockets
