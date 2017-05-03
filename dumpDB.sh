#!/bin/bash
# file: dumpDB.sh

printf "\n\033[1;30m($0) \033[0;37mwith params: \033[1;30m$*\033[0m\n"

dbUserName=$1:=theDBUser
dbName=$2:=theDB_name

if [ ! -f db.mysql.bak ]
then
        printf "old backup file not found\n"
else
        if [ -f db.mysql.bak.old ]
        then
                mv db.mysql.bak db.mysql.bak.old
        else
                printf "removing oldest backup\n"
                rm db.mysql.bak.old
                mv db.mysql.bak db.mysql.bak.old
        fi
fi

mysqldump -p -u $dbUserName $dbName > db.mysql.bak
