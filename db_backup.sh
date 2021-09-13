#!/bin/bash
# docker exec -it siciud-v2-back /bin/bash -c 'cd app/ && ./db_backup.sh'
clear
echo
echo "Realizando backup de la BD"
d=$(date -d '5 hours ago' +%Y%m%d%H%M)
echo "Fecha: ${d}"
fn="/app/db/data/${d}_siciud_v2.sql"
echo "Archivo: ${fn}"
pg_dump --dbname=postgresql://postgres:p0stg*3s@192.168.0.4:3505/siciud_v2  > $fn
# pg_dump --clean --schema-only --dbname=postgresql://postgres:p0stg*3s@192.168.0.4:3505/siciud_v2  > $fn
echo "Backup finalizado!"
echo