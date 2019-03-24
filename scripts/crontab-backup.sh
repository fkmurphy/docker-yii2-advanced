#!/bin/bash
date=$(date '+%d-%m-%Y')
docker exec -ti mysql_yii_programas bash /root/backup.sh
docker cp mysql_yii_programas:backup.$date.sql backups/
docker exec -ti mysql_yii_programas rm backup.$date.sql

