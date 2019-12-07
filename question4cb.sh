#!/usr/bin/bash
crontab -l > mycron
echo "0 4 * * * /usr/bin/bash cronping.sh" >> mycron
crontab mycron
rm mycron
