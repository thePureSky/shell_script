#!/bin/bash

date1=$(date --date="1 days ago" +%s)
date2=$(date +%s)

echo $date1
echo $date2

time=$(($date2 - $date1))
echo $time
s=$(($time % 60))
time=$(($time / 60))

m=$(($time % 60))
time=$(($time / 60))

h=$(($time % 60))
time=$(($time / 60))

d=$(($time % 60))
time=$(($time / 60))

echo "the time is $d days : $h hours : $m minutes : $s seconds"
