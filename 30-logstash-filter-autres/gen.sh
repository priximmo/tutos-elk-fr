#!/bin/bash

echo "127.0.0.1 10/06/2020 13 TESTU;BEGIN;start job-0.1;10156" | tee -a /tmp/input.log
sleep 3
echo "127.0.0.2 10/06/2020 13 TESTU;PROCESS;start job-0.1;10156" | tee -a /tmp/input.log
sleep 3
echo "10.127.0.156 10/06/2020 13 TESTU;BEGIN;start job-0.1;10156" | tee -a /tmp/input.log
sleep 3

