FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
# Apache用
RUN apt-get update -qq && apt-get install -y libssl-dev libcurl4-openssl-dev apache2-dev libapr1-dev libaprutil1-dev libxml2 libxslt-dev patch apache2

# 時間設定
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get install -y tzdata
RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
RUN dpkg-reconfigure --frontend noninteractive tzdata

RUN mkdir /app
WORKDIR /app
ADD ./rails/Gemfile /app
ADD ./rails/Gemfile.lock /app
RUN bundle install
ADD ./rails /app

COPY ./docker/ruby/default-ssl.conf /etc/apache2/sites-available/
COPY ./docker/ruby/000-default.conf /etc/apache2/sites-available/

RUN a2enmod proxy
RUN a2enmod proxy_http
RUN a2enmod rewrite
RUN a2enmod headers
RUN a2enmod ssl
RUN a2ensite default-ssl

RUN mkdir -p tmp/sockets

COPY ./docker/ruby/httpd-foreground /usr/local/bin/
EXPOSE 80
EXPOSE 443
CMD ["httpd-foreground"]
