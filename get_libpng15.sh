#!/bin/bash
# This file will download libpng15, build and install it to your home under usr.
# AKA: /home/<your_username>/usr
# I've chosen usr to match the root /usr directory on most linux systems.
# In addition to this, you will need a multilib compiler (gcc-multilib on Debian/Ubuntu and Arch Linux)
dirnm="libpng-1.5.20"
filename="${dirnm}.tar.xz"
url="http://sourceforge.net/projects/libpng/files/libpng15/1.5.20/${filename}/download"
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
CFLAGS=-m32 CXXFLAGS=-m32 LDFLAGS=-m32 \
./configure --build=i686-pc-linux-gnu \
  --prefix="${targetdir}"
# in case you want to rebuild this
make clean &&
make &&
make install

# return to the original directory
cd "${owd}"
