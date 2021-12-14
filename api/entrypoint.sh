#!/bin/bash

rm -f /myapp/tmp/pids/server.pid

bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails s -p 3001 -b '0.0.0.0'
