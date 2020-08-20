#!/bin/bash
set -e

bundle config set git.allow_insecure true
bundle install --jobs 2
bundle exec yarn install
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:seed
bundle exec rm -f /rails-app/tmp/pids/server.pid
bundle exec rails s -b '0.0.0.0'

exec "$@"
