#!/bin/sh

while true
do
  echo "`hostname`: `date`" >> /var/lib/mysql/hehe.txt
  sleep 60 
  ls -l /var/lib/mysql/hehe.txt
done
