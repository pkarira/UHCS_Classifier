#!/bin/bash
input="/home/pulkit/micrograph.txt"
x=0;
while IFS= read -r var
do
  i=${var##*,}
  #echo $i
  a[x]=${i::-1}
  x=$((x+1))
done < "$input"
x=0;y=1;b[0]=0;b[1]=0;b[2]=0;b[3]=0;b[4]=0;b[5]=0;b[6]=0;
for file in `ls -v *.tif`
do	
    if [[ ${a[$y]} == *"spheroidite+widmanstatten"* ]]
    then
     x=4
    elif [[ ${a[$y]} == *"pearlite+spheroidite"* ]]
    then
     x=5
    elif [[ ${a[$y]} == *"pearlite+widmanstatten"* ]]
    then
     x=6		
    elif [[ ${a[$y]} == *"pearlite"* ]]
    then
     x=0
    elif [[ ${a[$y]} == *"spheroidite"* ]]
    then
     x=1
    elif [[ ${a[$y]} == *"martensite"* ]]
    then
     x=2
    elif [[ ${a[$y]} == *"network"* ]]
    then
     x=3
    fi
    mv "$file" "${a[$y]}_${b[$x]}.tif"
    echo $x
    b[$x]=$((b[$x] + 1))
    y=$((y + 1))				
done

