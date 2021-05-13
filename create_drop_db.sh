#!/usr/bin/env bash

set -e

rails db:schema:load RAILS_ENV=test
echo "Database recreated successfully"