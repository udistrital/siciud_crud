#!/bin/bash
apt-get update -qq && apt-get install -y lsb-release && apt-get clean all
sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
apt-get update -qq && apt-get install -y nodejs postgresql-client-13
# apt-get update -qq && apt-get install -y nodejs postgresql-client
rm -f tmp/pids/server.pid
rm Gemfile.lock
gem install bundler
bundle install
bundle exec rails s -p 3000 -b '0.0.0.0'