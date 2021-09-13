#!/bin/bash
# docker exec -it siciud-v2-back /bin/bash -c 'cd app/ && ./backup_db.sh'
clear
echo
echo "Restaurando BD"
psql --dbname=postgresql://postgres:p0stg*3s@192.168.0.4:3505/siciud_v2 < /app/db/data/202105210940-prod-siciud-v2.sql
psql --dbname=postgresql://postgres:p0stg*3s@192.168.0.4:3505/siciud_v2 < /app/db/data/202105210940-prod-siciud-v2-admins.sql
echo "Restauracion finalizada!"
echo