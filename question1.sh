#!/usr/bin/bash

#part a
read -p "enter a number" num
count=1
while :
do
	if [ $((count * count)) -lt "$num" ];
	then
		echo $((count * count))
	else break
	fi
	count=$((count+1))
done

#part b
add() { echo "the sum of $1 and $ 2 is " $(("$1" + "$2"));  }
add -1 2
multiply() { echo "the multiplication of $1 and $2 is " $(("$1" * "$2"));  }
multiply 2 4
divide() { echo "the division of $1 and $2 is " $(("$1" / "$2"));  }
divide 4 0
