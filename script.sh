#!/bin/bash

USER=admini
SSH_KEY=/home/admini/.ssh/id_rsa
NEIGHTBORN_ADDR=
DATE=`date -I`
FILENAME=/var/log/from-server-45$DATE

echo "some payload" > $FILENAME

if [ -n $NEIGHTBORN_ADDR ]; then
    ssh -i $SSH_KEY $USER@$NEIGHTBORN_ADDR find /var/log -name from-server-45 -atime +2 -delete;
    scp -i $SSH_KEY $USER@$NEIGHTBORN_ADDR $FILENAME $FILENAME;
fi

exit 0