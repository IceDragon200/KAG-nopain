KAG nopain
==========

If you ever had problems with libpng when trying to launch KAG this is here
to help alleviate your problems even a weeee bit.

Let a rip!
```shell
# GET IT
git clone https://github.com/IceDragon200/KAG-nopain.git

# SETUP YOUR LIBRARIES
cd KAG-nopain
# nopain will attempt to sudo for the install_pkgs.sh, you may be prompted for your password.
./nopain.sh

# PLAY LIKE A BAWS
cd bin
./play-kag
```


## So what does it do exactly?
A quick ldd on my Arch Linux says that KAG relies on libpng, at the time of my writing, used libpng16,
KAG was compiled against a libpng15.
In addition, simply compiling libpng15 wasn't enough, libfreetype also used libpng, so it had
to be recompiled as well, that or preloading it, I prefered compiling for now.
