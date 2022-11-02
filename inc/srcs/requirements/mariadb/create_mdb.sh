#!/bin/bash

echo -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASS';\nCREATE DATABASE $DB_NAME;\nCREATE USER $DB_USER@'%' IDENTIFIED BY '$DB_USER_PASS';\nGRANT ALL ON $DB_NAME.* TO $DB_USER@'%';\n" > init.sql;

exec "$@"