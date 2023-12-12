#!/bin/bash
curl -s -b "session=...." https://adventofcode.com/2023/day/1/input | 
tr ' ' '\n' | 
awk '{
  x=$0
  gsub(/one/,"1")
  gsub(/two/,"2");gsub(/three/,"3");gsub(/four/,"4");gsub(/five/,"5");gsub(/six/,"6");gsub(/seven/,"7");gsub(/eight/,"8");gsub(/nine/,"9");y=$0;gsub(/[^0-9]/,"")
  a=substr($0,0,1);c=length($0);b=substr($0,c,1);d=a+''+b;sum += d; print NR,x,y,d,sum
} 
END {print sum}'


for el in $@; do 
	echo $el
	for (( i = ${#el}-1; i >= 0; i-- )); do 
		w=$(echo ${el:$i} | awk '
		  BEGIN { split("one two three four five six seven eight nine",n," ")}
		  {for (i=2; i<10; i++) { if ( substr($0,1,1) == i || index($0,n[i]) == 1 ) { print i; break } } }
		  ')
           if [ -n "$w" ]; then echo $w;break; fi
	done
done

