for i in $(find . -name '*.fit')
do
    if [ ! -e $(echo $i | sed 's/\.fit$/.csv/') ]
    then
        java -jar FitCSVTool.jar "$i"
    fi
done
