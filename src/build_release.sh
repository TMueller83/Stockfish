#!/bin/bash
###  modify as appropriate for you system
### all builds have added features, 4 opening books can be used, adaptive ply,
### play by FIDE Elo ratings or CCRL Elo ratings
###

### time the compile process
echo on
start=`date +%s`

#ARCH="ARCH=general-32"
#ARCH="ARCH=x86-32-old"
#ARCH="ARCH=x86-32"
#ARCH="ARCH=general-64"
#ARCH="ARCH=x86_64"
ARCH="ARCH=x86-64-modern"
#ARCH="ARCH=x86-64-bmi2"
#ARCH="ARCH=armv7"
#ARCH="ARCH=ppc-32"
#ARCH="ARCH=ppc-64comp"

#COMP="COMP=clang"
COMP="COMP=gcc"
#COMP="COMP=mingw"
#COMP="COMP=icc"

#BUILD="build"
BUILD="profile-build"

#make function
function mke() {
make -j $BUILD $ARCH $COMP "$@"
}

mke BLUEFISH=yes && wait
mke HONEY=yes BLUEFISH=yes && wait
mke HONEY=yes && wait
mke WEAKFISH=yes && wait
mke HONEY=yes FORTRESS_DETECT=yes


end=`date +%s`
runtime=$((end-start))
echo ""
echo Compile time $runtime seconds...
echo ""

