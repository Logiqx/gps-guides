grep '^Data,0,record,.*,speed,' tracks/APEX-Pro*.csv | sed -r 's/.*,speed,([^,]*),.*/\1/;s/"//g' | sort -un >tracks/APEX-Pro-unique-speeds.csv

