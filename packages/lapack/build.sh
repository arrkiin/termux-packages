TERMUX_PKG_HOMEPAGE=https://www.netlib.org/lapack/
TERMUX_PKG_DESCRIPTION=""
TERMUX_PKG_VERSION="3.7.0"
TERMUX_PKG_SHA256=ed967e4307e986474ab02eb810eed1d1adc73f5e1e3bc78fb009f6fe766db3be
TERMUX_PKG_SRCURL=http://www.netlib.org/lapack/lapack-${TERMUX_PKG_VERSION}.tgz
TERMUX_PKG_FOLDERNAME="lapack-${TERMUX_PKG_VERSION}"
TERMUX_PKG_BUILD_IN_SRC=yes
TERMUX_PKG_KEEP_STATIC_LIBRARIES=yes

termux_step_configure () {
    TERMUX_PKG_BUILDDIR=${TERMUX_PKG_SRCDIR}/SRC
    _TOOLCHAIN_DIR=/home/arrkiin/lib/android-ndk/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin
    TERMUX_PKG_FORTRAN_COMPILER=${_TOOLCHAIN_DIR}/${TERMUX_HOST_PLATFORM}-gfortran
    TERMUX_PKG_GCC_COMPILER=${_TOOLCHAIN_DIR}/${TERMUX_HOST_PLATFORM}-gcc
    TERMUX_PKG_LINKER=${_TOOLCHAIN_DIR}/${TERMUX_HOST_PLATFORM}-ar
    cp ${TERMUX_PKG_SRCDIR}/make.inc.example ${TERMUX_PKG_SRCDIR}/make.inc
    sed -ie "s@\(^FORTRAN\s*=\s\).*@\1${TERMUX_PKG_FORTRAN_COMPILER}@gi" ~/.termux-build/lapack/src/make.inc
    sed -ie "s@\(^LOADER\s*=\s\).*@\1${TERMUX_PKG_FORTRAN_COMPILER}@gi" ~/.termux-build/lapack/src/make.inc
    sed -ie "s@\(^ARCH\s*=\s\).*@\1${TERMUX_PKG_LINKER}@gi" ~/.termux-build/lapack/src/make.inc
    sed -ie "s@\(^CC\s*=\s\).*@\1${TERMUX_PKG_GCC_COMPILER}@gi" ~/.termux-build/lapack/src/make.inc
    sed -ie "s@\(^BLASLIB\s*=\s\).*@\1${TERMUX_PREFIX}\/lib\/libblas\.a@gi" ~/.termux-build/lapack/src/make.inc
}

termux_step_make_install () {
    cp ${TERMUX_PKG_SRCDIR}/liblapack.a ${TERMUX_PREFIX}/lib/
}
