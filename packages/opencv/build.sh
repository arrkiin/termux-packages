TERMUX_PKG_HOMEPAGE=http://opencv.org/
TERMUX_PKG_DESCRIPTION="Open Source Computer Vision Library"
_COMMIT="android_3"
TERMUX_PKG_VERSION="3.2"
TERMUX_PKG_SRCURL=https://github.com/arrkiin/opencv/archive/${_COMMIT}.zip
TERMUX_PKG_DEPENDS="python, python-dev, libjpeg-turbo, libpng, ffmpeg, numpy_devel"
TERMUX_PKG_FOLDERNAME="opencv-$_COMMIT"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DCMAKE_INSTALL_PREFIX=$TERMUX_PKG_TMPDIR/install
-DP4A=ON                                                                                                     
-DOPENCV_FORCE_PYTHON_LIBS=ON
-DPYTHON3_PACKAGES_PATH=$TERMUX_PREFIX/lib/python3.6/site-packages
-DPYTHON3_INCLUDE_PATH=$TERMUX_PREFIX/include/python3.6m
-DPYTHON3_LIBRARIES=$TERMUX_PREFIX/lib/libpython3.6m.so
-DPYTHON3_NUMPY_INCLUDE_DIRS=$TERMUX_PREFIX/lib/python3.6/site-packages/numpy/core/include
-DCMAKE_BUILD_TYPE=RELEASE
-DWITH_GTK=OFF
-DWITH_1394=OFF
-DBUILD_TESTS=OFF
-DBUILD_PERF_TESTS=OFF
-DWITH_JPEG=ON
-DBUILD_JPEG=OFF
-DBUILD_EXAMPLES=OFF
-DBUILD_ANDROID_EXAMPLES=OFF
"

# termux_step_pre_configure() {
    # export DESTDIR=$TERMUX_PKG_TMPDIR/install
# }

# -DPYTHON3_EXECUTABLE=$TERMUX_PREFIX/bin/python3.6
# -DPYTHON2_INCLUDE_PATH=/usr/include/python2.7
# -DPYTHON2_LIBRARIES=/usr/lib/x86_64-linux-gnu/libpython2.7.so
# -DPYTHON2_NUMPY_INCLUDE_DIRS=/usr/local/lib/python2.7/dist-packages/numpy/core/include
# termux_step_post_make_install () {
#
termux_step_post_make_install () {

    echo "Modify android install to fit termux on android install"

    echo "Make $TERMUX_PREFIX/lib directory"
    mkdir -p $TERMUX_PREFIX/lib

    echo "Copy $TERMUX_PKG_TMPDIR/install/sdk/native/3rdparty/libs/* $TERMUX_PREFIX/lib"
    cp -R $TERMUX_PKG_TMPDIR/install/sdk/native/3rdparty/libs/* $TERMUX_PREFIX/lib

    echo "Copy $TERMUX_PKG_TMPDIR/install/sdk/native/libs/* $TERMUX_PREFIX/lib"
    cp -R $TERMUX_PKG_TMPDIR/install/sdk/native/libs/* $TERMUX_PREFIX/lib
    
	echo "Make $TERMUX_PREFIX/etc" 
    mkdir -p $TERMUX_PREFIX/etc

	echo "Copy $TERMUX_PKG_TMPDIR/install/sdk/etc/* $TERMUX_PREFIX/etc"
    cp -R $TERMUX_PKG_TMPDIR/install/sdk/etc/* $TERMUX_PREFIX/etc
    
	echo "Make $TERMUX_PREFIX/include"
    mkdir -p $TERMUX_PREFIX/include

	echo "Copy $TERMUX_PKG_TMPDIR/install/sdk/native/jni/include/* $TERMUX_PREFIX/include"
    cp -R $TERMUX_PKG_TMPDIR/install/sdk/native/jni/include/* $TERMUX_PREFIX/include

    # echo "Copy $TERMUX_PKG_TMPDIR/install/usr/local/lib/python3.6/dist-packages/* $TERMUX_PREFIX/lib/python3.6/site-packages"
    # cp -R $TERMUX_PKG_TMPDIR/install/usr/local/lib/python3.6/dist-packages/* $TERMUX_PREFIX/lib/python3.6/site-packages

}
