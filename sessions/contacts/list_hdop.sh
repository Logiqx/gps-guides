for i in $(./*cor* | sed 's/:.*//')
do
	echo $i
	grep '^Data.*hdop,"' $i  | sed 's/.*hdop,"//;s/",.*//' | sort -un
	echo
done
