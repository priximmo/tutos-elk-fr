#!/bin/bash

echo "127.0.0.1 10/06/2020 xavier.moi 13 TESTU;BEGIN;start job-0.1 {agent{firefox}};10156.22" | tee -a /tmp/input.log
sleep 3
echo "server1 10/06/2020 pierre.paul 13 TESTU;BEGIN;start job-0.1 {agent{chrome}};10156.22" | tee -a /tmp/input.log
sleep 3
echo "10.169.12.34 10/06/2020 xavier.moi 13 TESTU;BEGIN;start job-0.1;10156" | tee -a /tmp/input.log
sleep 3

