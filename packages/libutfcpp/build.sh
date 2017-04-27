TERMUX_PKG_HOMEPAGE=http://utfcpp.sourceforge.net/
TERMUX_PKG_DESCRIPTION="A simple, portable and lightweight generic library for handling UTF-8 encoded strings."
TERMUX_PKG_VERSION=2.3.4
TERMUX_PKG_SHA256=3373cebb25d88c662a2b960c4d585daf9ae7b396031ecd786e7bb31b15d010ef
_VERSION=$(echo $TERMUX_PKG_VERSION|tr . _)
TERMUX_PKG_FOLDERNAME=utf8_v$TERMUX_PKG_VERSION
TERMUX_PKG_SRCURL=https://sourceforge.net/projects/utfcpp/files/utf8cpp_2x/Release%20${TERMUX_PKG_VERSION}/utf8_v${_VERSION}.zip
TERMUX_PKG_NO_DEVELSPLIT=yes
TERMUX_PKG_DEPENDS="libgmp,libmpfr,libutfcpp,gettext,libedit,python-dev"

termux_step_extract_package() {
	if [ -z "${TERMUX_PKG_SRCURL:=""}" ]; then
		mkdir -p "$TERMUX_PKG_SRCDIR"
		return
	fi
	cd "$TERMUX_PKG_TMPDIR"
	local filename
	filename=$(basename "$TERMUX_PKG_SRCURL")
	local file="$TERMUX_PKG_CACHEDIR/$filename"

	termux_download "$TERMUX_PKG_SRCURL" "$file" "$TERMUX_PKG_SHA256"

	folder=$TERMUX_PKG_FOLDERNAME
	if [ -z $folder ]; then
		echo $folder
		rm -Rf $folder
	fi
	mkdir -p $folder
	cd $folder

	if [ "${file##*.}" = zip ]; then
		unzip -q "$file"
	else
		$TERMUX_TAR xf "$file"
	fi

	cd ..
	mv $folder "$TERMUX_PKG_SRCDIR"
}

termux_step_make_install () {
	cp -R $TERMUX_PKG_SRCDIR/source/* $TERMUX_PREFIX/include
}
