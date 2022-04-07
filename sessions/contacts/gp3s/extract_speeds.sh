for i in $(ls tracks/*.csv)
do
	out=$(echo $i | sed 's/\.csv/-speeds.csv/')
	grep '^Data,0,record,.*,speed,' $i | sed -r 's/.*,speed,([^,]*),.*/\1/;s/"//g' | sort -un >$out
done

grep '^Data,[0-9]*,record,.*,enhanced_speed,' tracks/fenix-7/*.csv | sed -r 's/.*,enhanced_speed,([^,]*),.*/\1/;s/"//g' | sort -un >fenix-7-speeds.csv
