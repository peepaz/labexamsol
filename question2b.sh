#!/usr/bin/bash
declare -A usr_dept_arr
declare -A usr_level_arr

usr_dept_arr+=( [John]=Legal [Meg]=Legal [Taylor]=IT [Richard]=IT )
usr_level_arr+=( [John]=Junior [Meg]=Senior [Taylor]=Junior [Richard]=Senior )

for grp in Junior Senior Legal IT
do
	sudo groupadd "$grp"

done


for usr in "${!usr_dept_arr[@]}"
do
	sudo useradd "$usr"
	dept=~/Home/"${usr_dept_arr[$usr]}"
	deptFld="${usr_dept_arr[$usr]}"
	sudo mkdir -p "$dept"/{Documents,Meetings}
	sudo gpasswd -a "$usr" "$deptFld"
	sudo chgrp "$deptFld" "$dept"
	sudo chmod -R 000 "$dept"
	sudo chmod  070 "$dept"
	level="${usr_level_arr[$usr]}"

	sudo gpasswd -a "$usr" "$level"

	if [ "$level" == Junior ]; then 
		sudo setfacl -R -m g:"$level":rw  "$dept"/Documents
		sudo setfacl -R -m  g:"$level":--- "$dept"/Meetings
	elif [ "$level" == Senior ]; then
		sudo setfacl -R -m g:"$level":r "$dept"/Documents
		sudo setfacl -R -m g:"$level":rwx "$dept"/Meetings
	fi
done
