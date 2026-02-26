#!/bin/bash

while ! mysqladmin ping -h"$MYSQL_HOST" --silent; do
    echo "Esperando a que la bd inicialice correctamente"
    sleep 2
done

echo "MYSQL esta listo para ejecutarse y para exportar su data"


#bucle para obtener la data

while true; do
    TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
    mysqldump -u root -p"$MYSQL_ROOT_PASSWORD" -h "$MYSQL_HOST" "$MYSQL_DATABASE" > /backup/db_backup_"$TIMESTAMP".sql
    echo "Backup finalizado db_backup_"$TIMESTAMP".sql"
    sleep $BACKUP_INTERVAL
done
