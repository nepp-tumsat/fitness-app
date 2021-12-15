#!/bin/bash

rm -f /myapp/tmp/pids/server.pid
echo "start db create"
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails s -p 3001 -b '0.0.0.0'