grep '^Data,[0-9]*,record,.*,enhanced_speed,' tracks/fenix-6/*.csv | sed -r 's/.*,enhanced_speed,([^,]*),.*/\1/;s/"//g' | sort -un >fenix-6-speeds.csv
