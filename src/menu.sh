#!/bin/bash

PS3='Select by numbers: '
options=("Run PostgreSQL db" "Stop PostgreSQL db" "Create database and tables" "Get info from News-Feed" "Save info to PostgreSQL" "Export data to CSV format file" "Cron daily" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Run PostgreSQL db")
            /etc/init.d/postgresql start
            psql --command "ALTER user postgres WITH PASSWORD '$POSTGRES_PASSWORD';"
            ;;
        "Stop PostgreSQL db")
            /etc/init.d/postgresql stop
            ;;
        "Create database and tables")
            psql -a -f create_db.sql
            ;;
        "Get info from News-Feed")
            python3 scraper.py
            ;;
        "Save info to PostgreSQL")
            python3 save_to_db.py
            ;;
	    "Export data to CSV format file")
            python3 save_to_csv.py 
            ;;
        "Cron daily")
            bash cron.sh
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
