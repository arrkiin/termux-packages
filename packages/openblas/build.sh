TERMUX_PKG_HOMEPAGE=http://www.openblas.net
TERMUX_PKG_DESCRIPTION="OpenBLAS is an optimized BLAS library based on GotoBLAS2 1.13 BSD version"
TERMUX_PKG_VERSION="0.2.19"
TERMUX_PKG_SHA256=878353b52940e0d5be32011cd5ba8440758f5270c3fa0f6f6200c26eabc53f1c
TERMUX_PKG_SRCURL=https://sourceforge.net/projects/openblas/files/v${TERMUX_PKG_VERSION}/OpenBLAS%20${TERMUX_PKG_VERSION}%20version.tar.gz/download
TERMUX_PKG_FOLDERNAME="xianyi-OpenBLAS-9a7e0ec"
TERMUX_PKG_KEEP_STATIC_LIBRARIES=yes
TERMUX_PKG_BUILD_IN_SRC=yes
_TOOLCHAIN_DIR=/home/arrkiin/lib/android-ndk/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin
_FORTRAN_COMPILER=${_TOOLCHAIN_DIR}/${TERMUX_HOST_PLATFORM}-gfortran
_GCC_COMPILER=${_TOOLCHAIN_DIR}/${TERMUX_HOST_PLATFORM}-gcc

termux_step_configure () {
    return
}

termux_step_make () {

    export CFLAGS="--sysroot=${NDK}/platforms/android-24/arch-arm64"
    make TARGET=ARMV8 BINARY=64 HOSTCC=gcc CC=${_GCC_COMPILER} CFLAGS=${CFLAGS} FC=${_FORTRAN_COMPILER} libs

}
