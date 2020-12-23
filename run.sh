#!/bin/bash
apt-get update -qq && apt-get install -y nodejs postgresql-client
rm -f tmp/pids/server.pid
bundle install
bundle exec rails s -p 3000 -b '0.0.0.0'
