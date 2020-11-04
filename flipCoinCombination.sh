#!/bin/bash

echo "Flipping a Coin to show Head or Tail...."
head=1
tail=0

flip=$(( RANDOM % 2 ))
echo " "
if [[ $flip -eq $head ]]
then
	echo "Head Wins"

elif [[ $flip -eq $tail ]]
then
	echo "Tail Wins"
else
	exit
fi
