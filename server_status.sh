#!/bin/bash

host=$1

if [ -z $host ]; then
    echo "Usage: `basename $0` [HOST]"
    exit 1
fi

while :; do
    result=`ping -W 1 -c 1 $host | grep 'bytes from '`
    if [ $? -gt 0 ]; then
        echo -e "`date +'%Y/%m/%d %H:%M:%S'` - host $host is \033[0;31mOFFLINE\033[0m"
    else
         echo -e "`date +'%Y/%m/%d %H:%M:%S'` - host $host is \033[0;32mONLINE\033[0m -`echo $result | cut -d ':' -f 2`"
        sleep 1 # avoid ping rain
fi
done
