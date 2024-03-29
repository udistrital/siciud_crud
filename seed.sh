#!/bin/bash
rake db:drop
rake db:create
rake db:migrate
rake db:seed

# import data
rake import_oecd:load_data
rake import_cine:load_data
 rails import_types_subtypes:create_data
#rails import_types_subtypes:update_data
rake import_research_groups:data
rake add_group_roles:data
rake import_researchers:data
rake import_research_groups_members:data

# NOTE: 202011092136: 'postgresql-client' se requiere en la máquina:
# RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
#
# Does not work with environment variables, use rake task
# rake import_geos:load_data
 rails db -p <db/data/01-data-country.sql
 rails db -p <db/data/02-data-state.sql
 rails db -p <db/data/03-data-city.sql
