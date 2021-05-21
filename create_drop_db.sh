#!/usr/bin/env bash

set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

export SICIUD_CRUD_PGUSER="$(aws ssm get-parameter --name /${PARAMETER_STORE}/siciud_crud/db/username --output text --query Parameter.Value)"
export SICIUD_CRUD_PGPASS="$(aws ssm get-parameter --with-decryption --name /${PARAMETER_STORE}/siciud_crud/db/password --output text --query Parameter.Value)"

bundle exec rails db:schema:load

exec "$@"
