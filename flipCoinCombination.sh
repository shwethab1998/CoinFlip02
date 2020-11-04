#!/bin/bash 

declare -A dictCointriplet

heads=1
tails=0

function winHHH() {
	percent=$((($HHHwin*100)/$i))
	echo "HHH Win Percent is : " $percent
}

function winHHT() {
	percent=$((($HHTwin*100)/$i))
	echo "HHT Win Percent is : " $percent
}

function winHTT() {
        percent=$((($HTTwin*100)/$i))
        echo "HTT Win Percent is : " $percent
}

function winHTH() {
        percent=$(( ($HTHwin*100) / $i ))
        echo "HTH Win Percent is : " $percent
}

function winTTT() {
        percent=$((($TTTwin*100)/$i))
        echo "TTT Win Percent is : " $percent
}

function winTTH() {
        percent=$((($TTHwin*100)/$i))
        echo "TTH Win Percent is : " $percent
}

function winTHH() {
        percent=$((($THHwin*100)/$i))
        echo "THH Win Percent is : " $percent
}

function winTHT() {
        percent=$((($THTwin*100)/$i))
        echo "THT Win Percent is : " $percent
}


for (( i=0; i<=50; i++ )) 
do
	flip=$(( RANDOM % 2 ))
	flip1=$(( RANDOM % 2 ))
	flip2=$(( RANDOM % 2 ))
	if [[ $flip -eq $heads && $flip1 -eq $heads && $flip2 -eq $heads ]]
	then
		val="H"
		val1="H"
		val2="H"
		echo "HHH Win"
		((HHHwin++))

	elif [[ $flip -eq $tails && $flip1 -eq $tails && $flip2 -eq $tails ]]
	then
		val="T"
		val1="T"
		val2="T"
		echo "TTT Win"
		((TTTwin++))

	elif [[ $flip -eq $heads && $flip1 -eq $tails && $flip2 -eq $heads ]]
        then
                val="H"
                val1="T"
		val2="H"
                echo "HTH Win"
                ((HTHwin++))

        elif [[ $flip -eq $heads && $flip1 -eq $tails && $flip2 -eq $tails ]]
        then
                val="H"
                val1="T"
		val2="T"
                echo "HTT Win"
                ((HTT++))

	elif [[ $flip -eq $tails && $flip1 -eq $heads && $flip2 -eq $heads ]]
        then
                val="T"
                val1="H"
                val2="H"
                echo "THH Win"
                ((THHwin++))

	elif [[ $flip -eq $tails && $flip1 -eq $tails && $flip2 -eq $heads ]]
        then
                val="T"
                val1="T"
                val2="H"
                echo "TTH Win"
                ((TTHwin++))

	elif [[ $flip -eq $tails && $flip1 -eq $heads && $flip2 -eq $tails ]]
        then
                val="T"
                val1="H"
                val2="T"
                echo "THT Win"
                ((THTwin++))

	elif [[ $flip -eq $heads && $flip1 -eq $heads && $flip2 -eq $tails ]]
        then
                val="H"
                val1="H"
                val2="T"
                echo "HHT Win"
                ((HHTwin++))

	else
		exit
	fi


        dictCoinTriplet["$i"]=$val$val1$val2


done

echo "Flipping Coin Store the doublet Combination......."
echo ${!dictCoinTriplet[@]}
echo ${dictCoinTriplet[@]}

winHHH
winTTT
winHTH
winHHT
winTHH
winTTH
winTHT
winHHT
