#!/bin/bash
filename="kag-linux32-client-release.tar.gz"
url="http://dl.kag2d.com/${filename}"
dirnm="kag"

if ! [[ -f "${filename}" ]]; then
  echo "Fetching ${filename}"
  (curl -L -R "${url}" -o "${filename}") || exit
fi

# check if we've already extracted the files
if ! [[ -d "${dirnm}" ]]; then
  echo "Extracting ${filename}"
  mkdir "${dirnm}" && (tar -vxf "${filename}" -C "${dirnm}") || exit
fi
