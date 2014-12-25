#!/bin/sh

# prepare a build env for android in the android-build directory

top=$(dirname $(readlink -f $0))
cd $top

if test $# -eq 0 ; then
    SDK=$ANDROID_HOME
elif test $# -eq 1 ; then
    SDK=$1
else
    SDK=$1
    NDK=$2
fi

if test x"$SDK" = x ; then
    echo "No SDK given - either set ANDROID_HOME or pass it as an argument"
    exit 1
fi

if test x"$NDK" = x ; then
    NDK=$(ls -1d $(dirname $SDK)/android-ndk-* | tail -1)
fi

$SDK/tools/android update project -n BeebDroid -p . --target android-21

echo "ndk.dir=$NDK" >> local.properties
