FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs unixodbc-dev
RUN mkdir /app
WORKDIR /app
ADD ./rails/Gemfile /app
ADD ./rails/Gemfile.lock /app
RUN bundle install
ADD ./rails /app
RUN mkdir -p tmp/sockets
