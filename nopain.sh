#!/bin/bash
(bash install_pkgs.sh) || exit
(bash get_libpng15.sh) || exit
(bash get_freetype.sh) || exit
(bash get_kag.sh) || exit
