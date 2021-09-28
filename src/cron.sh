#write out current crontab
crontab -l > cron_news
#Hourly
echo "00 * * * * python3 scraper.py;python3 save_to_csv.py" >> cron_news
#install new cron file
crontab cron_news
crontab -l
# rm cron_news
