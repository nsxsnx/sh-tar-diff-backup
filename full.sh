#!/bin/sh
. /mnt/DATA2/backup/conf.sh
BACKUP_NAME=fileshare_full

date "+%Y-%m-%d %H:%M" > ${DATE_FILE}
tar -cjf ${BACKUP_DIR}/${BACKUP_NAME}_${BACKUP_DATE}.tbz ${SOURCE_DIR}

if [ $? -gt 0 ]
then
	CUR_DATE=`date "+%y%m%d_%H%M%S"`
	echo "${CUR_DATE}: full backup failed" >> ${LOG_FILE}
fi
