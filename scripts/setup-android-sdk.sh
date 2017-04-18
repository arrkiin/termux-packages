#!/bin/sh
set -e -u

# Install desired parts of the Android SDK:
test -f $HOME/.termuxrc && . $HOME/.termuxrc
: ${ANDROID_HOME:="${HOME}/lib/android-sdk"}
: ${NDK:="${HOME}/lib/android-ndk"}

if [ ! -d $ANDROID_HOME ]; then
	mkdir -p $ANDROID_HOME
	cd $ANDROID_HOME/..
	rm -Rf `basename $ANDROID_HOME`

	curl --fail --retry 3 -o tools.zip https://dl.google.com/android/repository/tools_r25.2.3-linux.zip
	rm -Rf android-sdk
	unzip -q tools.zip -d android-sdk
	rm tools.zip
fi

NDK_VERSION=r13b

if [ ! -d $NDK ]; then
	mkdir -p $NDK
	cd $NDK/..
	rm -Rf `basename $NDK`
	curl --fail --retry 3 -o ndk.zip \
		http://dl.google.com/android/repository/android-ndk-${NDK_VERSION}-`uname`-x86_64.zip

	rm -Rf android-ndk-$NDK_VERSION
	unzip -q ndk.zip
	mv android-ndk-$NDK_VERSION `basename $NDK`
	rm ndk.zip
fi

UNAME=`uname | tr [A-Z] [a-z]`
TOOLCHAIN=aarch64-linux-android
TOOLCHAIN_VERSION=4.9
TOOLCHAIN_FILE=gcc-arm64-${UNAME}-x86_64.tar.bz2
TOOLCHAIN_TARGET=$NDK/toolchains/${TOOLCHAIN}-${TOOLCHAIN_VERSION}/prebuilt/${UNAME}-x86_64

if [ ! -e ${TOOLCHAIN_TARGET}/bin/${TOOLCHAIN}-gfortran ]; then
    mkdir -p $NDK/../tmp
    cd $NDK/../tmp
    curl --fail --retry 3 -L -o toolchain.tar.bz2 \
        https://github.com/buffer51/android-gfortran/releases/download/${NDK_VERSION}/${TOOLCHAIN_FILE}
    tar -xf toolchain.tar.bz2
    cp -R ${TOOLCHAIN}-${TOOLCHAIN_VERSION}/* ${TOOLCHAIN_TARGET}
    rm toolchain.tar.bz2
    rm -Rf $NDK/../tmp
fi

echo y | $ANDROID_HOME/tools/android update sdk --no-ui --all --no-https -t "build-tools-25.0.1,android-24"
