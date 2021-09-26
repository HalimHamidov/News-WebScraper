#!/bin/bash

PS3='Select by numbers: '
options=("Run PostgreSQL" "Stop PostgreSQL" "Create schema" "Get some data from Reuters" "Save data to PostgreSQL" "Export data to CSV" "Cron hourly" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Run PostgreSQL")
            /etc/init.d/postgresql start
            psql --command "ALTER USER postgres WITH PASSWORD '$POSTGRES_PASSWORD';"
            ;;
        "Stop PostgreSQL")
            /etc/init.d/postgresql stop
            ;;
        "Create schema")
            psql -a -f create_db.sql
            ;;
        "Get some data from Reuters")
            python3 scraper.py
            ;;
        "Save data to PostgreSQL")
            python3 save_to_db.py
            ;;
	"Export data to CSV")
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
