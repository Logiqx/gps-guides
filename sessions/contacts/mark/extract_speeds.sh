grep '^Data,0,record,.*,speed,' tracks/vertix/*.csv | sed -r 's/.*,speed,([^,]*),.*/\1/;s/"//g' | sort -un >vertix-speeds.csv

grep '^Data,[^,]*,record,.*,speed,' tracks/fenix-5/*.csv | sed -r 's/.*,speed,([^,]*),.*/\1/;s/"//g' | sort -un >fenix-5-speeds.csv

grep '^Data,[0-9]*,record,.*,enhanced_speed,' tracks/20220406/*.csv | sed -r 's/.*,enhanced_speed,([^,]*),.*/\1/;s/"//g' | sort -un >fenix-7-speeds.csv
