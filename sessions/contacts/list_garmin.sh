find . -name '*.csv' -exec grep -H '^Data,0,file_id,.*manufacturer,"1",' {} \; | sed 's/:.*garmin_product,"/: /;s/",.*//'
