#!/bin/bash
# rails db:schema:load
 rake db:drop
 rake db:create
 rake db:migrate
 rake db:seed
 rake add_groups_roles:data
 rake import_researchers:data
 rake import_research_groups:data
 rake import_research_groups_members:data
 rake import_oecd:load_data

# NOTE: 202011092136: 'postgresql-client' se requiere en la máquina:
# RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
 rails db -p <db/data/01-data-country.sql
 rails db -p <db/data/02-data-state.sql
 rails db -p <db/data/03-data-city.sql
