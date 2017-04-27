TERMUX_PKG_HOMEPAGE=http://boost.org/
TERMUX_PKG_DESCRIPTION="Boost provides free peer-reviewed portable C++ source libraries."
TERMUX_PKG_VERSION=1.64.0
_VERSION=$(echo $TERMUX_PKG_VERSION|tr . _)
TERMUX_PKG_SHA256=0445c22a5ef3bd69f5dfb48354978421a85ab395254a26b1ffb0aa1bfd63a108
TERMUX_PKG_SRCURL=https://dl.bintray.com/boostorg/release/${TERMUX_PKG_VERSION}/source/boost_${_VERSION}.tar.gz
TERMUX_PKG_FOLDERNAME=boost_${_VERSION}
TERMUX_PKG_NO_DEVELSPLIT=yes

termux_step_make_install () {
	cp -R ${TERMUX_PKG_SRCDIR}/boost ${TERMUX_PREFIX}/include
}
