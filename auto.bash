#!/bin/bash
USR=`logname`
AFL_PATH="/home/$USR/workspace/protocol/tools/fuzz_target"
PROG_PATH="/home/$USR/workspace/protocol/progs/selftls"
NTHREAD=$2
PACKET=$1

# usage

function usage
{
printf "Usage of this testing script:\n"
printf "---sudo ./auto.bash PACKET_SEQ_Number Number_of_Threads\n"
printf "---currently only support:\n"
printf "------PACKET_SEQ_Number: int from 1 to 2\n"
printf "------Number_of_Threads: int from 1 to N\n, don't be greedy and leave some cores for others\n"
}

# check arg format

if [ $# -ne 2 ] || [ $1 -lt 1 ] || [ $1 -gt 4 ] || [ $2 -lt 1 ]
then
echo "invalid arguments, check usage"
usage
exit -1
fi

# check if the output dir is empty or not

function isEmpty
{
path=$1
if [ "$(ls -A $path)" ]
then
rm -rf $path/*
fi
}

for (( i=0;i<$NTHREAD;i++ ))
do
in_dir=p"$PACKET"
out_dir=out_target_p"$PACKET"
isEmpty $out_dir
sub_out_dir=fuzzer"$i"
$AFL_PATH/experimental/asan_cgroups/limit_memory.sh -u $USR $AFL_PATH/afl-fuzz  -i $PROG_PATH/in/$in_dir -o $PROG_PATH/$out_dir -M $sub_out_dir -m none -E $PACKET $PROG_PATH/selftls $PACKET @@ &
done
