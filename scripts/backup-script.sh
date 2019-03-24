#!/bin/bash

mysqldump -u $MYSQL_USER --password=$MYSQL_PASSWORD $MYSQL_DATABASE > backup.$(date '+%d-%m-%Y').sql
exit 0
