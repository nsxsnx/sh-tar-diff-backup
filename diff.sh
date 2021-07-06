#!/bin/sh
. /mnt/DATA2/backup/conf.sh
BACKUP_NAME=fileshare_diff

LAST_FULL_DATE=`cat ${DATE_FILE}`
tar -cjf ${BACKUP_DIR}/${BACKUP_NAME}_${BACKUP_DATE}.tbz --newer-mtime "${LAST_FULL_DATE}" ${SOURCE_DIR}

if [ $? -gt 0 ]
then
        CUR_DATE=`date "+%y%m%d_%H%M%S"`
        echo "${CUR_DATE}: full backup failed" >> ${LOG_FILE}
	exit
fi

find ${BACKUP_DIR} -name "${BACKUP_NAME}_*" -ctime +62 -delete
