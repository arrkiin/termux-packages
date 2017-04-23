TERMUX_PKG_HOMEPAGE=https://www.scipy.org/
TERMUX_PKG_DESCRIPTION="NumPy is the fundamental package for scientific computing with Python"
TERMUX_PKG_VERSION="1.12.1"
TERMUX_PKG_SHA256=a65266a4ad6ec8936a1bc85ce51f8600634a31a258b722c9274a80ff189d9542
TERMUX_PKG_SRCURL=https://github.com/numpy/numpy/releases/download/v${TERMUX_PKG_VERSION}/numpy-${TERMUX_PKG_VERSION}.zip
TERMUX_PKG_DEPENDS="python, python-dev, openblas"
TERMUX_PKG_FOLDERNAME="numpy-${TERMUX_PKG_VERSION}"
TERMUX_PKG_BUILD_IN_SRC=yes
TERMUX_PKG_EXTRA_CONFIGURE_ARGS=""

termux_step_make () {

    CC="'/home/arrkiin/lib/android-ndk/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-gcc -I/data/data/com.termux/files/usr/include/python3.6m --sysroot=/home/arrkiin/lib/android-ndk/platforms/android-24/arch-arm64'" \
    LDSHARED="'/home/arrkiin/lib/android-ndk/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-gcc -I/data/data/com.termux/files/usr/include/python3.6m --sysroot=/home/arrkiin/lib/android-ndk/platforms/android-24/arch-arm64'" \
    LD='/home/arrkiin/lib/android-ndk/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-ld' \
    AR='/home/arrkiin/lib/android-ndk/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-ar' \
    F90='/home/arrkiin/lib/android-ndk/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-gfortran' \
    F77='/home/arrkiin/lib/android-ndk/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-gfortran' \
    LDFLAGS=' -shared -static' \
    python3.6 setup.py build_ext

}

termux_step_make_install () {

    CC="'/home/arrkiin/lib/android-ndk/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-gcc -I/data/data/com.termux/files/usr/include/python3.6m --sysroot=/home/arrkiin/lib/android-ndk/platforms/android-24/arch-arm64'" \
    LDSHARED="'/home/arrkiin/lib/android-ndk/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-gcc -I/data/data/com.termux/files/usr/include/python3.6m --sysroot=/home/arrkiin/lib/android-ndk/platforms/android-24/arch-arm64'" \
    LD='/home/arrkiin/lib/android-ndk/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-ld' \
    AR='/home/arrkiin/lib/android-ndk/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-ar' \
    F90='/home/arrkiin/lib/android-ndk/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-gfortran' \
    F77='/home/arrkiin/lib/android-ndk/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-gfortran' \
    LDFLAGS=' -shared -static' \
    pip install . --target ${TERMUX_PREFIX}/lib/python3.6/site-packages --no-deps --ignore-installed

}
