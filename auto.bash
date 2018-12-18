USR=$(whoami)
AFL_PATH="/home/$USR/workspace/protocol/tools/fuzz_target"
PROG_PATH="/home/$USR/workspace/protocol/tools/selftls"
sudo $AFL_PATH/experimental/asan_cgroups/limit_memory.sh -u $USR $AFL_PATH/afl-fuzz  -i $PROG_PATH/in/p1 -o $PROG_PATH/out_target -M fuzzer01 -m none -E 1 $PROG_PATH/selftls 1 @@ 
sudo $AFL_PATH/experimental/asan_cgroups/limit_memory.sh -u $USR $AFL_PATH/afl-fuzz  -i $PROG_PATH/in/p1 -o $PROG_PATH/out_target -S fuzzer02 -m none -E 1 $PROG_PATH/selftls 1 @@ 
sudo $AFL_PATH/experimental/asan_cgroups/limit_memory.sh -u $USR $AFL_PATH/afl-fuzz  -i $PROG_PATH/in/p1 -o $PROG_PATH/out_target -S fuzzer03 -m none -E 1 $PROG_PATH/selftls 1 @@ 
sudo $AFL_PATH/experimental/asan_cgroups/limit_memory.sh -u $USR $AFL_PATH/afl-fuzz  -i $PROG_PATH/in/p1 -o $PROG_PATH/out_target -S fuzzer04 -m none -E 1 $PROG_PATH/selftls 1 @@ 
sudo $AFL_PATH/experimental/asan_cgroups/limit_memory.sh -u $USR $AFL_PATH/afl-fuzz  -i $PROG_PATH/in/p1 -o $PROG_PATH/out_target -S fuzzer05 -m none -E 1 $PROG_PATH/selftls 1 @@ 
sudo $AFL_PATH/experimental/asan_cgroups/limit_memory.sh -u $USR $AFL_PATH/afl-fuzz  -i $PROG_PATH/in/p1 -o $PROG_PATH/out_target -S fuzzer06 -m none -E 1 $PROG_PATH/selftls 1 @@ 
sudo $AFL_PATH/experimental/asan_cgroups/limit_memory.sh -u $USR $AFL_PATH/afl-fuzz  -i $PROG_PATH/in/p1 -o $PROG_PATH/out_target -S fuzzer07 -m none -E 1 $PROG_PATH/selftls 1 @@ 
sudo $AFL_PATH/experimental/asan_cgroups/limit_memory.sh -u $USR $AFL_PATH/afl-fuzz  -i $PROG_PATH/in/p1 -o $PROG_PATH/out_target -S fuzzer08 -m none -E 1 $PROG_PATH/selftls 1 @@ 
sudo $AFL_PATH/experimental/asan_cgroups/limit_memory.sh -u $USR $AFL_PATH/afl-fuzz  -i $PROG_PATH/in/p1 -o $PROG_PATH/out_target -S fuzzer09 -m none -E 1 $PROG_PATH/selftls 1 @@ 
sudo $AFL_PATH/experimental/asan_cgroups/limit_memory.sh -u $USR $AFL_PATH/afl-fuzz  -i $PROG_PATH/in/p1 -o $PROG_PATH/out_target -S fuzzer10 -m none -E 1 $PROG_PATH/selftls 1 @@ 
