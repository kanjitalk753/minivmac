#!/bin/sh

# we need to build the setup tool first
if [ ! -x ./setup_t ]; then
	gcc -o setup_t setup/tool.c
fi

# run setup tool to generate Xcode project generator
./setup_t -t mc64 > setup.sh

# generate Xcode project
bash ./setup.sh

# Open Xcode project
echo "A ROM file (vMac.ROM) and a disk image (disk1.dsk) are required to "
echo "run Mini vMac, place them in this directory and build the project."
echo ""
echo "Opening Xcode project..."
open minivmac.xcodeproj
