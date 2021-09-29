#!/bin/bash

# Setup a cron schedule
echo "0 * * * * python3 /src/save_to_db.py 2>&1
# This extra line makes it a valid cron" >scheduler.txt
echo "Start cron schedule"
crontab scheduler.txt
# cron -f
#Lists the status of the user's cron jobs.