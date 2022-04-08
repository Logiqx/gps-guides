BIN=$(dirname $0)

for suffix in coros garmin hdop sats
do
    script=list_$suffix.sh
    echo "Running $script..."
    $BIN/$script >$BIN/../txt/$suffix.txt
done
