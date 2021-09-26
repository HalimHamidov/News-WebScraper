#!/bin/bash

PS3='Select by numbers: '
options=("Run PostgreSQL db" "Stop PostgreSQL db" "Create database and tables" "Get info from News-Feed" "Save info to PostgreSQL" "Export data to CSV" "Cron hourly" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Run PostgreSQL")
            /etc/init.d/postgresql start
            psql --command "ALTER DB USER  WITH PASSWORD '$POSTGRES_PASSWORD';"
            ;;
        "Stop PostgreSQL")
            /etc/init.d/postgresql stop
            ;;
        "Create schema")
            psql -a -f create_db.sql
            ;;
        "Get some data from News-Feed site")
            python3 scraper.py
            ;;
        "Save data to PostgreSQL")
            python3 save_to_db.py
            ;;
	    "Export data to CSV format file")
            python3 out_from_db.py
            ;;
        "Cron hourly")
            bash cron.sh
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
