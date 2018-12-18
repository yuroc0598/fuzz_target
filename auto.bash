#!/bin/bash
USR=`logname`
AFL_PATH="/home/$USR/workspace/protocol/tools/fuzz_target"
PROG_PATH="/home/$USR/workspace/protocol/progs/selftls"
NTHREAD=$1
for (( i=0;i<$NTHREAD;i++ ))
do
out_dir=fuzzer"$i"
$AFL_PATH/experimental/asan_cgroups/limit_memory.sh -u $USR $AFL_PATH/afl-fuzz  -i $PROG_PATH/in/p1 -o $PROG_PATH/out_target -M $out_dir -m none -E 1 $PROG_PATH/selftls 1 @@ &
done
