#!/bin/bash

if [ `uname` == Darwin ]; then
    PY_LIB="libpython2.7.dylib"
else
    PY_LIB="libpython2.7.so"
fi

mkdir build
cd build
cmake                                                               \
    -DPYTHON2_EXECUTABLE=$PREFIX/bin/python                          \
    -DPYTHON2_INCLUDE_DIR=$PREFIX/include/python2.7/                 \
    -DPYTHON2_LIBRARY=$PREFIX/lib/$PY_LIB                            \
    -DPYTHON2_PACKAGES_PATH=$PREFIX/lib/python2.7/site-packages/     \
    -DCMAKE_INSTALL_PREFIX=$PREFIX                                  \
    -DWITH_CUDA=OFF                                                 \
    -DWITH_AVFOUNDATION=OFF                                         \
    -DWITH_FFMPEG=OFF                                               \
    -DJPEG_INCLUDE_DIR:PATH=$PREFIX/include                         \
    -DJPEG_LIBRARY:FILEPATH=$PREFIX/lib/libjpeg.so                  \
    -DPNG_PNG_INCLUDE_DIR:PATH=$PREFIX/include                      \
    -DPNG_LIBRARY:FILEPATH=$PREFIX/lib/libpng.so                    \
    -DZLIB_INCLUDE_DIR:PATH=$PREFIX/include                         \
    -DZLIB_LIBRARY:FILEPATH=$PREFIX/lib/libz.so                     \
    ..
make
make install
