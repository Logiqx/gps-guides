find . -name '*.csv' -exec grep -H '^Data,0,file_id,.*manufacturer,"1",' {} \; | sed 's/:.*serial_number,"/: serial /;s/",.*garmin_product,"/ product /;s/",.*//'
