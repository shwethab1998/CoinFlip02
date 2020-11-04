#!/bin/bash
declare -A dictCoin
echo "Flipping a Coin to obtain Singleton Value and Percentage"
head=1
tail=0

function winHead() {
	percent=$((($headwin*100)/$i))
	echo "Head Win Percent is : " $percent
}

function winTail() {
	percent=$((($tailwin*100)/$i))
	echo "Tail Win Percent is : " $percent
}

for (( i=0; i<=5; i++ ))
do
	flip=$(( RANDOM % 2 ))
	if [[ $flip -eq $head ]]
	then
		toss="HEADS"
		echo "Head Wins"
		((headwin++))

	elif [[ $flip -eq $tail ]]
	then
		toss="TAILS"
		echo "Tail Wins"
		((tailwin++))
	else
		exit
	fi
	dictCoin["$i"]=$val

done
echo "Flipping Coin Store the Singlet Combination......."

echo ${!dictCoin[@]}
echo ${dictCoin[@]}

winHead
winTail
