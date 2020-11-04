#!/usr/bin/env bash

# Example:
#./wait.sh 50 http://localhost:9080/auth

if [ $# -eq 0 ]
  then
    echo "No arguments supplied. Please provide a timeout value in second and the url."
    exit 1
fi

SLEEP_TIME=1
TIMEOUT=$1
URL=$2
ELAPSE_TIME=0

while ! curl -sSf $URL &>/dev/null
do
	ELAPSE_TIME=$((ELAPSE_TIME+SLEEP_TIME))
    if [ $((ELAPSE_TIME < TIMEOUT)) == 0 ]
    then
		echo "Host Not Found - `date`"
		exit 1
    fi
    sleep $SLEEP_TIME
done

GREEN='\033[0;32m'
printf "${GREEN} Host Found after $ELAPSE_TIME seconds\n"
