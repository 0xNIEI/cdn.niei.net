#!/bin/bash
sudo apt-get install cron -y
sudo mkdir /scripts 2> /dev/null
sudo touch /scripts/update.sh
sudo chmod +x /scripts/update.sh
sudo echo '#!/bin/bash' > /scripts/update.sh
sudo echo "sudo apt update && apt upgrade -y && apt autoremove -y && reboot" >> /scripts/update.sh
sudo crontab -l > cron_TMP
sudo echo "0 3 * * 0 bash /scripts/update.sh" >> cron_TMP
sudo crontab cron_TMP > /dev/null
sudo rm cron_TMP

echo "Configuration successfull!"