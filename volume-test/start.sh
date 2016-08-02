#!/bin/sh

while true
do
  date>>/var/lib/mysql/hehe.txt
  sleep 60 
  ls -l /var/lib/mysql/hehe.txt
done
