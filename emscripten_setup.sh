#!/bin/sh

# we need to build the setup tool first
gcc -o setup_t setup/tool.c

# run setup tool to generate makefile generator
# we bump up the number of disks to 20 so that we can handle more disk images
# being mounted (per https://developer.apple.com/library/archive/technotes/fl/fl_530.html
# more than 20 is problematic)
./setup_t \
    -t emsc \
    -api esc \
    -sound 1 \
    -drives 20 \
    -sony-tag 1 \
    -sony-sum 1 \
    -sony-dc42 1 \
    $@ \
    > setup.sh

# generate Makefile
bash ./setup.sh

make clean

