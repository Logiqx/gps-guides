grep '^Data,[0-9]*,record,.*,enhanced_speed,' tracks/fenix-6/*.csv | sed -r 's/.*,enhanced_speed,([^,]*),.*/\1/;s/"//g' | sort -un >fenix-6-speeds.csv
grep '^Data,[0-9]*,record,.*,enhanced_speed,' tracks/vertix-2/*.csv | sed -r 's/.*,enhanced_speed,([^,]*),.*/\1/;s/"//g' | sort -un >vertix-2-speeds.csv
