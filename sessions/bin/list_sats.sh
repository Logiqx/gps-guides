for i in $(./*cor* | sed 's/:.*//')
do
	echo $i
	grep '^Data,.*,speed,.*,Sat,"' $i  | sed 's/.*Sat,"//;s/",.*//' | sort -un
	echo
done
