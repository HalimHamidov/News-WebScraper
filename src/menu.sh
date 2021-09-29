#!/bin/bash

PS3='Select by numbers: '
options=("Start postgresql server" "Create schema" "Run scrapper" "Save data to postgresql" "Retrieve data to csv" "Cron check" "Cron start" "Quit")
select opt in "${options[@]}"; do
    case $opt in
    "Start postgresql server")
        /etc/init.d/postgresql start
        psql --command "ALTER user postgres WITH PASSWORD '$POSTGRES_PASSWORD';"
        ;;
    "Create schema")
        psql -a -f create_db.sql
        ;;
    "Run scrapper")
        python3 scraper.py
        ;;
    "Save data to postgresql")
        python3 save_to_db.py
        ;;
    "Retrieve data to csv")
        python3 save_to_csv.py
        ;;
    "Cron check")
        bash croncheck.sh
        ;;
    "Cron start")
        bash entrypoint.sh
        ;;
    "Quit")
        break
        ;;
    *) echo "invalid option $REPLY" ;;
    esac
done
