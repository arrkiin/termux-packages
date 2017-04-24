TERMUX_PKG_HOMEPAGE=https://www.scipy.org/
TERMUX_PKG_DESCRIPTION="NumPy is the fundamental package for scientific computing with Python"
TERMUX_PKG_VERSION="1.12.1"
TERMUX_PKG_SHA256=a65266a4ad6ec8936a1bc85ce51f8600634a31a258b722c9274a80ff189d9542
TERMUX_PKG_SRCURL=https://github.com/numpy/numpy/releases/download/v${TERMUX_PKG_VERSION}/numpy-${TERMUX_PKG_VERSION}.zip
TERMUX_PKG_DEPENDS="python, python-dev, openblas"
TERMUX_PKG_FOLDERNAME="numpy-${TERMUX_PKG_VERSION}"
TERMUX_PKG_BUILD_IN_SRC=yes
TERMUX_PKG_CLANG=no

termux_step_make () {

    CC="${CC}" LDSHARED="${CC} -shared" F90=${FC} F77=${FC} LDFLAGS="${LDFLAGS} -L${TERMUX_PREFIX}/sysroot/usr/lib" python3.6 setup.py build_ext \
	--include-dirs "${TERMUX_PREFIX}/include:${TERMUX_PREFIX}/include/python3.6m" \
	--library-dirs "${TERMUX_PREFIX}/lib:${TERMUX_STANDALONE_TOOLCHAIN}/sysroot/usr/lib" \
	--rpath "${TERMUX_PREFIX}/lib" \
	--libraries python3.6m

}

termux_step_make_install () {

    CC="${CC}" LDSHARED="${CC} -shared" F90=${FC} F77=${FC} LDFLAGS="${LDFLAGS} -L${TERMUX_PREFIX}/sysroot/usr/lib" \
    pip install . --target ${TERMUX_PREFIX}/lib/python3.6/site-packages --no-deps --ignore-installed --upgrade

}

termux_step_post_massage () {

	pattern=-x86_64-linux-gnu
	files=$(find . -type f -name *${pattern}.so)
	for f_in in ${files}
	do
        	f_out=$(echo "${f_in}"  | sed "s@${pattern}@@")
            echo "${f_in} -> ${f_out}"
	        mv ${f_in} ${f_out}
	done

}
