#!/bin/bash
dirnm="freetype-2.5.5"
filename="${dirnm}.tar.gz"
url="http://sourceforge.net/projects/freetype/files/freetype2/2.5.5/${filename}/download"
owd=$(pwd)

# try to download the file, if it already exists, just forget about it
if ! [[ -f "${filename}" ]]; then
  echo "Fetching ${filename}"
  (curl -L -R "${url}" -o "${filename}") || exit
fi

# check if we've already extracted the files
if ! [[ -d "build/${dirnm}" ]]; then
  echo "Extracting ${filename}"
  mkdir -p "build"
  (tar -vxf "${filename}" -C "build") || exit
fi

#targetdir="${HOME}/usr"
targetdir="${owd}/usr"
mkdir -p "${targetdir}"

# do the building
cd "build/${dirnm}" &&
# I never, ever, want to do this shit ever again.
export LIBPNG_LIBS=png15
export PKG_CONFIG_PATH="./usr/lib/pkgconfig:${PKG_CONFIG_PATH}"
CFLAGS=-m32 CXXFLAGS=-m32 LDFLAGS=-m32 \
./configure --build=i686-pc-linux-gnu \
  --prefix="${targetdir}"
# in case you want to rebuild this
make clean &&
make &&
make install

# return to the original directory
cd "${owd}"
