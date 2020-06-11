#!/bin/bash

echo "10/06/2020;13;TESTU;BEGIN;start job" >> /tmp/input.log
sleep 5
echo "10/06/2020;13;TESTU;PROCESS;collect file" >> /tmp/input.log
sleep 5
echo "10/06/2020;13;TESTU;PROCESS;process file" >> /tmp/input.log
sleep 5
echo "10/06/2020;13;TESTU;PROCESS;update file" >> /tmp/input.log
sleep 5
echo "10/06/2020;13;TESTU;END;end job" >> /tmp/input.log
