#!/usr/bin/env sh

BACKUP_FOLDER=/mnt/tnas1/volume1/public/data/backup/media-lib-db
BACKUP_FILE=${BACKUP_FOLDER}/dump_`date +%Y%m%d%H%M%s`.sql

echo "Backing up db to file: ${BACKUP_FILE}"

docker exec -t medialibdb pg_dumpall -c -U postgres > ${BACKUP_FOLDER}/dump_`date +%Y%m%d%H%M%s`.sql

cd $BACKUP_FOLDER
ls -1l ${BACKUP_FILE}

gzip ${BACKUP_FILE}

echo "Backup Files:"
ls -1l ${BACKUP_FOLDER}