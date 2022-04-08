BIN=$(dirname $0)

for i in $($BIN/*cor* | sed 's/:.*//')
do
	echo $i
	grep '^Data,.*,speed,.*,Sat,"' $i  | sed 's/.*Sat,"//;s/",.*//' | sort -un
	echo
done
