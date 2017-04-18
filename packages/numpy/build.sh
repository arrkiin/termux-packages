TERMUX_PKG_HOMEPAGE=https://www.scipy.org/
TERMUX_PKG_DESCRIPTION="NumPy is the fundamental package for scientific computing with Python"
TERMUX_PKG_VERSION="1.12.1"
TERMUX_PKG_SHA256=a65266a4ad6ec8936a1bc85ce51f8600634a31a258b722c9274a80ff189d9542
TERMUX_PKG_SRCURL=https://github.com/numpy/numpy/releases/download/v${TERMUX_PKG_VERSION}/numpy-${TERMUX_PKG_VERSION}.zip
TERMUX_PKG_DEPENDS="python, python-dev"
TERMUX_PKG_FOLDERNAME="numpy-${TERMUX_PKG_VERSION}"
TERMUX_PKG_BUILD_IN_SRC=yes
TERMUX_PKG_EXTRA_CONFIGURE_ARGS=""

termux_step_make () {
    python3.6 setup.py build_ext --inplace --plat-name arm64-v8a
}
