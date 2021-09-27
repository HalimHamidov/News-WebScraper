#write out current crontab
#crontab -l > cron_news
#Hourly
echo "* 00 * * * python get_data.py;python save_data.py" >> cron_news
#install new cron file
crontab cron_news
rm cron_news
