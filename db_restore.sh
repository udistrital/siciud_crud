#!/bin/bash
# docker exec -it siciud-v2-back /bin/bash -c 'cd app/ && ./db_restore.sh'
clear
echo
echo "Restaurando BD"
psql --dbname=postgresql://postgres:p0stg*3s@192.168.0.4:3505/siciud_v2_prod < /app/db/data/202109131230_backup_siciud_prod.sql
echo "Restauracion finalizada!"
echo