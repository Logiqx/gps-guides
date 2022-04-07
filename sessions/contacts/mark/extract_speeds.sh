grep '^Data,0,record,.*,speed,' tracks/apex-pro*.csv | sed -r 's/.*,speed,([^,]*),.*/\1/;s/"//g' | sort -un >apex-pro-speeds.csv

grep '^Data,[^,]*,record,.*,speed,' tracks/fenix-5*.csv | sed -r 's/.*,speed,([^,]*),.*/\1/;s/"//g' | sort -un >fenix-5-speeds.csv
