#!/bin/bash
input=$(curl -s -b "session=...." https://adventofcode.com/2023/day/1/input) 

#
#
#
for el in "$input"; do #  $@; do 

sum=0
for el in $@; do 
	w1=0 # echo -n $el" "
	for (( i = 0; i < ${#el}; i++ )); do
 		w1=$(echo ${el:$i} | awk '
   			BEGIN { split("one two three four five six seven eight nine",n," ")}
      			{for (i=1; i<10; i++) { if ( substr($0,1,1) == i || index($0,n[i]) == 1 ) { print i; break } } }
   		')
   		if [ -n "$w1" ]; then break; fi # echo -n $w;break; fi
 	done
 	w2=0
	for (( i = ${#el}-1; i >= 0; i-- )); do 
		w2=$(echo ${el:$i} | awk '
		  BEGIN { split("one two three four five six seven eight nine",n," ")}
		  {for (i=1; i<10; i++) { if ( substr($0,1,1) == i || index($0,n[i]) == 1 ) { print i; break } } }
		')
           if [ -n "$w2" ]; then break; fi # echo $w;break; fi
	done
	sum=$((sum+=w1*10+w2))

done
echo "Sum: "$sum
 
done

