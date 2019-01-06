#!/bin/bash
USR=`logname`
AFL_PATH="/home/$USR/workspace/protocol/tools/fuzz_target"
PROG_PATH="/home/$USR/workspace/protocol/progs/selftls"
NTHREAD=$2
PACKET=$1

# usage

function usage
{
echo "Usage of this testing script:"
echo "---sudo ./auto.bash PACKET_SEQ_Number Number_of_Threads"
echo "---currently only support:"
echo "------PACKET_SEQ_Number: int from 1 to 2"
echo "------Number_of_Threads: int from 1 to N, don't be greedy and leave some cores for others"
}

# check arg format

if [ $# -ne 2 ] || [ $1 -lt 1 ] || [ $1 -gt 4 ] || [ $2 -lt 1 ]
then
echo "invalid arguments, check usage below:"
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


function checkExist
{
path=$1
if [ !d $path ]
then
mkdir -p $path
fi
}

for (( i=0;i<$NTHREAD;i++ ))
do
in_dir=p"$PACKET"
out_dir=out_target_p"$PACKET"
checkExist "$PROG_PATH/$out_dir"
isEmpty "$PROG_PATH/$out_dir"
sub_out_dir=fuzzer"$i"
if [ $i -eq 0 ]
then
$AFL_PATH/experimental/asan_cgroups/limit_memory.sh -u $USR $AFL_PATH/afl-fuzz  -i $PROG_PATH/in/$in_dir -o $PROG_PATH/$out_dir -M $sub_out_dir -m none -t 500 -E $PACKET $PROG_PATH/selftls $PACKET @@ &
else
$AFL_PATH/experimental/asan_cgroups/limit_memory.sh -u $USR $AFL_PATH/afl-fuzz  -i $PROG_PATH/in/$in_dir -o $PROG_PATH/$out_dir -S $sub_out_dir -m none -t 500 -E $PACKET $PROG_PATH/selftls $PACKET @@ &
fi
done
