#!/bin/bash

# initalize array for storing process ids aka PIDs
kill_process=();

#for loop to get process id from lsof on given aurguments and push to PIDs array
for ports in "$@"
do
    pid=$(lsof -i:$ports -t);
    set -f;
    kill_process+=(${pid})
done


# for loop for killing all the process stored in an array
for e in ${kill_process[@]}
do
    echo $e
    kill -9 $e
done
