#!/bin/bash
# docker exec -it siciud-v2-back /bin/bash -c 'cd app/ && ./backup_db.sh'
clear
echo
echo "Realizando backup de la BD"
d=$(date -d '5 hours ago' +%Y%m%d%H%M)
echo "Fecha: ${d}"
sch="/app/db/data/${d}_siciud_v2_01_schema.sql"
dat="/app/db/data/${d}_siciud_v2_02_data.sql"
db="postgresql://postgres:p0stg*3s@192.168.0.4:3505/siciud_v2"
echo "Esquema: ${sch}"
echo "Datos: ${dat}"
pg_dump --clean --schema-only --dbname=$db > $sch
pg_dump --column-inserts --data-only --dbname=$db > $dat
echo "Backup finalizado!"
echo