grep '^Data,[^,]*,record,.*,speed,' tracks/*/fenix-3/*.csv | sed -r 's/.*,speed,([^,]*),.*/\1/;s/"//g' | sort -un >fenix-3-speeds.csv
