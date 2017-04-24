TERMUX_PKG_HOMEPAGE=http://www.openblas.net
TERMUX_PKG_DESCRIPTION="OpenBLAS is an optimized BLAS library based on GotoBLAS2 1.13 BSD version"
TERMUX_PKG_VERSION="0.2.19"
TERMUX_PKG_SHA256=878353b52940e0d5be32011cd5ba8440758f5270c3fa0f6f6200c26eabc53f1c
TERMUX_PKG_SRCURL=https://sourceforge.net/projects/openblas/files/v${TERMUX_PKG_VERSION}/OpenBLAS%20${TERMUX_PKG_VERSION}%20version.tar.gz/download
TERMUX_PKG_FOLDERNAME="xianyi-OpenBLAS-9a7e0ec"
TERMUX_PKG_KEEP_STATIC_LIBRARIES=yes
TERMUX_PKG_BUILD_IN_SRC=yes
TERMUX_PKG_CLANG=no

termux_step_configure () {
    return
}

termux_step_make () {

    #export CFLAGS="--sysroot=${NDK}/platforms/android-24/arch-arm64"
    echo "make TARGET=ARMV8 BINARY=${TERMUX_ARCH_BITS} HOSTCC=${CC_FOR_BUILD} CC=${CC} CFLAGS=${CFLAGS} FC=${FC} libs"
    make TARGET=ARMV8 BINARY=${TERMUX_ARCH_BITS} HOSTCC=${CC_FOR_BUILD} CC=${CC} CFLAGS="${CFLAGS}" FC=${FC} libs

}
