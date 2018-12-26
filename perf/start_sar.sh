#! /bin/sh
# start_perf.sh <duration sec>
sar -o ./perf_data -A 1 $1 > /dev/null 2>&1 &
