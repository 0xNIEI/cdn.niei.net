#!/bin/bash
sudo apt-get install cron -y
sudo mkdir /scripts > /dev/null
sudo touch /scripts/update.sh
sudo chmod +x /scripts/update.sh
sleep 1
sudo echo '#!/bin/bash' > /scripts/update.sh
sudo echo "sudo apt update && apt upgrade -y && apt autoremove -y && reboot" >> /scripts/update.sh
sleep 1
#create cron job to run every sunday at 03:00
#write out current crontab
sudo crontab -l > cron_TMP
#echo new cron into cron file
sudo echo "0 3 * * 0 bash /scripts/update.sh" >> cron_TMP
#install new cron file
sudo crontab cron_TMP > /dev/null
sudo rm cron_TMP
sleep 1

echo "Configuration successfull!"