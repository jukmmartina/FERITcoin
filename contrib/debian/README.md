
Debian
====================
This directory contains files used to package feritcoind/feritcoin-qt
for Debian-based Linux systems. If you compile feritcoind/feritcoin-qt yourself, there are some useful files here.

## feritcoin: URI support ##


feritcoin-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install feritcoin-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your feritcoin-qt binary to `/usr/bin`
and the `../../share/pixmaps/feritcoin128.png` to `/usr/share/pixmaps`

feritcoin-qt.protocol (KDE)

