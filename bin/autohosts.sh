#!/bin/bash

URL_OLD_HOSTS=/etc/hosts
URL_NEW_HOSTS=https://coding.net/u/onekeyhosts/p/text/git/raw/master/hosts

if [ `grep "http://www.findspace.name" $URL_OLD_HOSTS | wc -l` -gt 0 ]; then
    BEGIN=$(grep -n "^#+BEGIN" $URL_OLD_HOSTS | awk -F: '{print $1}')
    diff -Naur <(tail -n +$BEGIN $URL_OLD_HOSTS) <(curl -sL $URL_NEW_HOSTS) | patch -p1 $URL_OLD_HOSTS
else
    curl -sL $URL_NEW_HOSTS >> $URL_OLD_HOSTS
fi
