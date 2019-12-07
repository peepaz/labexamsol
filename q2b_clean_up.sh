#!/usr/bin/bash
curr_dir=./
cd "$HOME"
sudo rm -rf Home/
for u in  John Meg Taylor Richard john meg taylor richard
do
sudo userdel "$u"
done
for g in  Legal legal IT It Junior junior Senior senior
do
sudo groupdel "$g"
done

