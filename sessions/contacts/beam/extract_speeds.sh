grep '^Data,[^,]*,record,.*,speed,' tracks/*/vivoactive-3/*.csv | sed -r 's/.*,speed,([^,]*),.*/\1/;s/"//g' | sort -un >vivoactive-3-speeds.csv
