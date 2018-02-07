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
    convert -crop 644x484 "$file" cropped_%d.tif
    rm -f cropped_1.tif
    mv "cropped_0.tif" "$file"
    convert -crop 322x242 "$file" cropped_%d.tif
    rm -f $file
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
    for file in cropped*
    do 
	mv "$file" "${a[$y]}_${b[$x]}.tif"
	b[$x]=$((b[$x] + 1)) 
    done 
    y=$((y + 1))				
done

