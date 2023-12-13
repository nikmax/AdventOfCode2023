#!/bin/bash
curl -s -b "session=...." https://adventofcode.com/2023/day/3/input |

awk   '
BEGIN {emp=".";p="";sum=0}
{
na=split($0,a,"");
np=split(p,ap,"")
r=$0;print "__"$0;
#first run old numbers
for(nm in am){
	m=am[nm];f=af[nm];l=al[nm]	
	for(i=f;i<=l;i++)
		if(a[i]!=emp){print m":0:"a[i];sum=sum+m;break}
	#if(i<=l){continue}#damit nicht doppelt summiert wird	
	delete am[nm];delete af[nm];delete al[nm]
}
of=0
while(match(r,/[0-9]+/)){
	if(RSTART>0){
		m=substr(r,RSTART,RLENGTH)
		l=RSTART+RLENGTH+of
		f=of+RSTART;of=RLENGTH;
		nm=NR"_"f;f--;
		sub(/[0-9]+/,"",r)
	   	if(f<1){f=1} else if(a[f]!=emp){print m":1:"a[f];sum=sum+m;continue}
		if(l>na){l=na} else if(a[l]!=emp){print m":2:"a[l];sum=sum+m;continue}
		if(np>0){
			for (i=f;i<=l;i++){if(ap[i]!=emp){print m":3:"ap[i];sum=sum+m;break}}
			if(i<=l){continue}#damit nicht doppelt summiert wird	
		}
		# nummer in array speichern
		am[nm]=m;af[nm]=f;al[nm]=l
		
		print "store: "m" "f" "l" "i" "nm

	}
}
p=$0;
}
END {for(nm in am) print am[nm]":"nm;print "sum: "sum}
' 
