#write out current crontab
#crontab -l > mycron
#Hourly
echo "00 * * * * python get_data.py;python save_data.py" >> mycron
#install new cron file
crontab mycron
rm mycron
