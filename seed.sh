#!/bin/bash
rails db:schema:load
rake db:seed
rake import_research_groups:data
rails db -p <db/data/01-data-country.sql
rails db -p <db/data/02-data-state.sql
rails db -p <db/data/03-data-city.sql
