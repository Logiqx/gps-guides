find . -name '*.csv' -exec grep -H "^Data,0,.*garmin_product" {} \; | sed 's/:.*garmin_product,"/: /;s/",.*//'
