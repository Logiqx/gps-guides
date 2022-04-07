find . -name '*.csv' -exec grep -H '^Data,0,file_id,.*manufacturer,"294",' {} \; | sed 's/:.*product_name,"/: /;s/",.*//'
