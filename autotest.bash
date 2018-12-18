#!/bin/bash

./afl-fuzz  -Q -i testin -o testout /bin/cat @@
