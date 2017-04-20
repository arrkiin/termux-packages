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
    # Cannot build, just for the header files
    return
}

termux_step_make_install () {
    
    NUMPY_INCLUDES_SRC=numpy/core/include/numpy
    NUMPY_INCLUDES_DST=$TERMUX_PREFIX/lib/python3.6/site-packages/${NUMPY_INCLUDES_SRC}
    mkdir -p ${NUMPY_INCLUDES_DST}
    cp -R ${NUMPY_INCLUDES_SRC}/* ${NUMPY_INCLUDES_DST}
    cp $TERMUX_PKG_BUILDER_DIR/include/* ${NUMPY_INCLUDES_DST}

}
