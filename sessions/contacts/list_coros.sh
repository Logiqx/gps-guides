find . -name '*.csv' -exec grep -H "^Data,0,.*product_name" {} \; | sed 's/:.*product_name,"/: /;s/",.*//'
