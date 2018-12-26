#! /bin/sh
# start_perf.sh <duration sec>
sadf -g ./perf_data  -- -r  > mem.svg
sadf -g ./perf_data  -- -P ALL  > cpus.svg
