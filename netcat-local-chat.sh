#!/bin/sh

CONFIG=~/.netcat-local-chat

if [ ! -r $CONFIG ]
then
    touch $CONFIG
    echo "HOST=127.0.0.1" > $CONFIG
    echo "PORT=2323" >> $CONFIG
    echo "Please, edit the config "$CONFIG" and try again."
    exit 1
fi

HOST=`cat $CONFIG | grep HOST | sed 's/HOST=//'`
PORT=`cat $CONFIG | grep PORT | sed 's/PORT=//'`

nc $HOST $PORT

if [ $? -eq 1 ]
then
    nc -l $PORT
fi

exit 0

