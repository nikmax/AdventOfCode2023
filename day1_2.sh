#!/bin/bash
function convert_digit {

}
curl -s -b "session=...." https://adventofcode.com/2023/day/1/input | tr ' ' '\n' | awk ' {x=$0;gsub(/one/,"1");gsub(/two/,"2");gsub(/three/,"3");gsub(/four/,"4");gsub(/five/,"5");gsub(/six/,"6");gsub(/seven/,"7");gsub(/eight/,"8");gsub(/nine/,"9");y=$0;gsub(/[^0-9]/,""); a=substr($0,0,1);c=length($0);b=substr($0,c,1);d=a+''+b;sum += d; print NR,x,y,d,sum} END {print sum}'
