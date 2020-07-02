#!/bin/bash

PATH="/tmp/input${1}.log"

echo $PATH

echo "log 10.134.56.78 10/06/2020 xavier.moi 13 TESTU;BEGIN;start job-0.1" | /usr/bin/tee -a "${PATH}"
/bin/sleep 1
echo "log 192.134.245.56 10/06/2020 pierre.paul 14 TESTU;BEGIN;start job-0.1" | /usr/bin/tee -a "${PATH}"
/bin/sleep 1
echo "alert 10.169.12.34 10/06/2020 xavier.moi 15 TESTU;BEGIN;start job-0.1;10156" | /usr/bin/tee -a "${PATH}"
/bin/sleep 1

