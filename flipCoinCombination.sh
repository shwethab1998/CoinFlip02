#!/bin/bash 
declare -A dictCoinSinglet
declare -A dictCoinDoublet
declare -A dictCoinTriplet
heads=1
tails=0
function winT() { 
	percent=$(((Twin*100)/$i))
	echo "H win Percent is : " $percent
}
function winH() {
	percent=$((($Hwin*100)/$i))
	echo "T win Percent is : " $percent
}
function winHH() {
   percent=$((($HHwin*100)/$i))
   echo "HH Win Percent is : " $percent
}
function winTT() {
   percent=$(((TTwin*100)/$i))
   echo "TT Win Percent is : " $percent
}
function winHT() {
   percent=$((($HTwin*100)/$i))
   echo "HT Win Percent is : " $percent
}
function winTH() {
   percent=$((($THwin*100)/$i))
   echo "TH Win Percent is : " $percent
}
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
for (( i=0; i<=50; i++ )) do
   flip=$(( RANDOM % 2 ))
   if [[ $flip -eq $heads ]]
   then
      val="HEADS"
      ((Hwin++))
   elif [[ $flip -eq $tails ]]
   then
      val="TAILS"
      ((Twin++))
   else
      exit
   fi
   dictCoinSinglet["$i"]=$val
done
echo " "
echo "Flipping Coin Store the Singlet Combination......."
echo ${dictCoinSinglet[@]}
for (( i=0; i<=50; i++ ))
do
   flip=$(( RANDOM % 2 ))
   flip1=$(( RANDOM % 2 ))
   if [[ $flip -eq $heads && $flip1 -eq $heads ]]
   then
      val="H"
      val1="H"
      ((HHwin++))
   elif [[ $flip -eq $tails && $flip1 -eq $tails ]]
   then
      val="T"
      val1="T"
      ((TTwin++))
   elif [[ $flip -eq $heads && $flip1 -eq $tails ]]
   then
      val="H"
      val1="T"
      ((HTwin++))
   elif [[ $flip -eq $tails && $flip1 -eq $heads ]]
   then
      val="T"
      val1="H"
      ((THwin++))
	else
      exit
   fi
   dictCoinDoublet["$i"]=$val$val1
done
echo " "
echo "Flipping Coin Store the doublet Combination......."
echo ${dictCoinDoublet[@]}
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
		((HHHwin++))
	elif [[ $flip -eq $tails && $flip1 -eq $tails && $flip2 -eq $tails ]]
	then
		val="T"
		val1="T"
		val2="T"
		((TTTwin++))
	elif [[ $flip -eq $heads && $flip1 -eq $tails && $flip2 -eq $heads ]]
   then
      val="H"
      val1="T"
		val2="H"
      ((HTHwin++))
   elif [[ $flip -eq $heads && $flip1 -eq $tails && $flip2 -eq $tails ]]
   then
      val="H"
     	val1="T"
		val2="T"
      ((HTT++))
	elif [[ $flip -eq $tails && $flip1 -eq $heads && $flip2 -eq $heads ]]
   then
      val="T"
      val1="H"
      val2="H"
      ((THHwin++))
	elif [[ $flip -eq $tails && $flip1 -eq $tails && $flip2 -eq $heads ]]
   then
      val="T"
      val1="T"
      val2="H"
      ((TTHwin++))
	elif [[ $flip -eq $tails && $flip1 -eq $heads && $flip2 -eq $tails ]]
   then
      val="T"
      val1="H"
      val2="T"
      ((THTwin++))
	elif [[ $flip -eq $heads && $flip1 -eq $heads && $flip2 -eq $tails ]]
   then
      val="H"
      val1="H"
      val2="T"
      ((HHTwin++))
	else
		exit
	fi
   dictCoinTriplet["$i"]=$val$val1$val2
done
echo " "
echo "Flipping Coin Store the triplet Combination......."
echo ${dictCoinTriplet[@]}
echo " "
echo "Sorting Percent of singlet, doublet & triplet......."

function sortingAllCombination(){
winH
winT
winHH
winTT
winHT
winTH
winHHH
winTTT
winHTH
winHHT
winTHH
winTTH
winTHT
winHHT
}


sortingAllCombination | sort -n -k6
