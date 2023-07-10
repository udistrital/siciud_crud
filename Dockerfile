FROM ruby:2.6.2-alpine

RUN apk --update add build-base nodejs tzdata postgresql-dev postgresql-client libxslt-dev libxml2-dev imagemagick

RUN apk add --no-cache \
        python3 \
        py3-pip \
    && pip3 install --upgrade pip \
    && pip3 install --no-cache-dir \
        awscli \
    && rm -rf /var/cache/apk/*

RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

RUN apk update && apk add --virtual build-dependencies build-base
RUN gem install bundler:2.2.11
RUN bundle install
COPY . /myapp

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 8080

# Start the main process.
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "8080"]