BIN=$(dirname $0)

for i in $(find . -name '*.fit')
do
    if [ ! -e $(echo $i | sed 's/\.fit$/.csv/') ]
    then
        java -jar $BIN/FitCSVTool.jar "$i"
    fi
done
