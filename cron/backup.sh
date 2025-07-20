#!/bin/sh

# TODO
# - Maybe organize some magic numbers better.
# - We should probably check if we have enough space to try a backup.

# We store on disk the time of the next backup, so the first thing to do is to
# read it. If the file does not exists we assume that the next backup was due at
# epoch. We also briefly calculate current time.
if [ -e "${HOME}/.next_backup" ]
then
    NEXTBACKUP=$(cat ${HOME}/.next_backup)
else
    NEXTBACKUP=0
fi

NOW=$(date '+%s')

# If we are past the due date of the next backup it is time to back everything up.
# Otherwise we gracefully exit the script.
if [ ${NOW} -gt ${NEXTBACKUP} ]
then
    # Actually perform the backup.
    tar -zcpf ${HOME}/backup.tar.gz ${HOME}/documents
    
    # Log that a backup happened and update the next backup's deadline on disk.
    # The next deadline will be 3 days from now.
    echo "`date +'%Y-%m-%d %H:%M:%S'` succesfully backed up in ~/backup.tar.gz"
    date --date='3 days' '+%s' > "${HOME}/.next_backup"
else
    # Log that nothing happened.
    echo "`date +'%Y-%m-%d %H:%M:%S'` not time to backup yet"
fi
