#!/bin/bash

kill_process=();

for ports in "$@"
do
    pid=$(lsof -i:$ports -t);
    set -f;
    kill_process+=(${pid})
done




for e in ${kill_process[@]}
do
    echo $e
    kill -9 $e
done
