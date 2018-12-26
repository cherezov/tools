#! /bin/sh
# perf.sh <command with args>
sar -o ./perf_data -A 1 300 > /dev/null &
pid=$!

time $@
kill -9 $pid

sadf -g ./perf_data  -- -r  > mem.svg
sadf -g ./perf_data  -- -P ALL  > cpu.svg
