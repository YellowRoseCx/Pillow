#!/bin/bash

version=0.11.1

./download-and-extract.sh highway-1.3.0 https://github.com/google/highway/archive/1.3.0.tar.gz

pushd highway-1.3.0
cmake -DCMAKE_BUILD_TYPE=Release -DHWY_ENABLE_TESTS=OFF -DHWY_ENABLE_EXAMPLES=OFF .
make -j4 install/strip
popd

rm -rf highway-1.3.0 highway-1.3.0.tar.gz

./download-and-extract.sh libjxl-$version https://github.com/libjxl/libjxl/archive/v$version.tar.gz

pushd libjxl-$version
cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DJPEGXL_ENABLE_SJPEG=OFF -DJPEGXL_ENABLE_SKCMS=OFF -DBUILD_TESTING=OFF -DJPEGXL_ENABLE_BENCHMARK=OFF -DJPEGXL_ENABLE_EXAMPLES=OFF -DJPEGXL_ENABLE_MANPAGES=OFF .
make -j4 install/strip
popd

rm -rf libjxl-$version libjxl-$version.tar.gz
