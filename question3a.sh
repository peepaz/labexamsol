#!/usr/bin/bash
#sudo apt-get install -y gnupg2
gpg --import  labexam.gpg
read -p "enter a message." msg
echo "$msg" > message.txt
gpg --encrypt --recipient 'Nicholas Mendez' message.txt

