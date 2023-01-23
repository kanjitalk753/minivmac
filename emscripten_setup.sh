#!/bin/sh

# we need to build the setup tool first
gcc -o setup_t setup/tool.c

# run setup tool to generate makefile generator
./setup_t \
    -t emsc \
    -api esc \
    $@ \
    > setup.sh

# generate Makefile
bash ./setup.sh

make clean

