set -e

sh ./script/run.sh &
PID=$!
echo $PID

trap "kill $PID" 1 2 3 15
wait
