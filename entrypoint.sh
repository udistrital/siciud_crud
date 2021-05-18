#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

if [ -n "${PARAMETER_STORE:-}" ]; then
  export SICIUD_CRUD_PGUSER="$(aws ssm get-parameter --name /${PARAMETER_STORE}/siciud_crud/db/username --output text --query Parameter.Value)"
  export SICIUD_CRUD_PGPASS="$(aws ssm get-parameter --with-decryption --name /${PARAMETER_STORE}/siciud_crud/db/password --output text --query Parameter.Value)"
fi

rails db:schema:load
rails db:seed

rails import_oecd:load_data
rails import_cine:load_data
rails import_types_subtypes:create_data
rails import_research_groups:data
rails add_group_roles:data
rails import_researchers:data
rails import_research_groups_members:data

rails db -p <db/data/01-data-country.sql
rails db -p <db/data/02-data-state.sql
rails db -p <db/data/03-data-city.sql

exec "$@"
