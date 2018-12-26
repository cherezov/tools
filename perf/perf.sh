#! /bin/sh
# perf.sh <command with args>
rm -rf ./perf_data
rm -rf ./mem.svg
rm -rf ./cpu.svg

sar -o ./perf_data -A 1 300 > /dev/null &
pid=$!

sleep 2
time $@
sleep 2

kill -9 $pid 2> /dev/null
wait $pid 2> /dev/null

sadf -g ./perf_data  -- -r  > mem.svg
sadf -g ./perf_data  -- -P ALL  > cpu.svg
