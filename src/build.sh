#!/bin/csh
###  modify as appropriate for you system
### alias mke="make -j profile-build ARCH=x86-64-modern"
### all builds have added features, 4 opening books can be used, adaptive ply,
### play by FIDE Elo ratings or CCRL Elo ratings
###

echo on
set start_time=`date +%s`
#echo $start_time

set ARCH = "ARCH=x86-64-modern"
#set  ARCH = "ARCH=x86-64-bmi2"

set COMP = "COMP=gcc"
#set COMP = "COMP=clang"

set BUILD = "build"
#set  BUILD = "profile-build"

### build honey
make clean && make -j $BUILD $ARCH $COMP VERSION=sullivan
wait
### build honey with fortress detection
make clean && make -j $BUILD $ARCH $COMP VERSION=sullivan FORTRESS_DETECT=yes
wait

### build honey-blue
make clean && make -j $BUILD $ARCH $COMP VERSION=sullivan BLUEFISH=yes
wait
### build honey-blue with fortress detection
make clean && make -j $BUILD $ARCH $COMP VERSION=sullivan BLUEFISH=yes FORTRESS_DETECT=yes
wait

### build bluefish with added features
make clean && make -j $BUILD $ARCH $COMP BLUEFISH=yes
wait
### build bluefish with fortress detection and added features
make clean && make -j $BUILD $ARCH $COMP BLUEFISH=yes FORTRESS_DETECT=yes
wait

### build stockfish with fortress detection
make clean && make -j $BUILD $ARCH $COMP FORTRESS_DETECT=yes
wait
### build stockfish with features
make clean && make $BUILD $ARCH $COMP
wait

set end_time=`date +%s`
#echo $end_time
echo execution time was `expr $end_time - $start_time` seconds
