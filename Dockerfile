FROM ruby:2.5.1
RUN apt-get update -qq && \
    curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
    apt-get install -y nodejs sqlite3

RUN gem install rails -v 5.2.1 -N
RUN mkdir /qanda
WORKDIR /qanda
COPY . /qanda

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

#CMD ["rails", "server", "-b", "0.0.0.0"]