## ENCRYPTED FILESYSTEM [ENCFS](http://www.arg0.net/encfs) GUI WRAPPER

This bash script provides a simple gui around the
[encfs](http://www.arg0.net/encfs) command line utility to mount
and unmount an encrypted directory. This script requires
[encfs](http://www.arg0.net/encfs),
[zenity](http://live.gnome.org/Zenity), and
[xdg-open](http://portland.freedesktop.org/wiki/).

The idea is to create a shortcut link to this script on your desktop
(specifying no terminal session needed) adding your source
[encfs](http://www.arg0.net/encfs) dir and your target mount
point dir as arguments to the script. Whenever you want to mount your
private directory, you click on the desktop shortcut. The script uses
[zenity](http://live.gnome.org/Zenity) to prompt you for the passphrase
and then mounts the [encfs](http://www.arg0.net/encfs) directory.
If you click on the shortcut when it is mounted, then
[zenity](http://live.gnome.org/Zenity) prompts you to unmount it. There
are some other options, see usage below.

I only use a single encrypted directory under my home directory. My
motivation for creating this script is to give quick single click access
from my desktop to that encrypted directory. I do not want my passphrase
cached anywhere, and I want an easy single click way to close off access.

A sample desktop file (`encfsui.desktop`) is included.

Home: <http://github.com/bulletmark/encfsui>  
Author: Mark Blakeney, <markb@berlios.de>

### PREREQUISITES

Requires bash + encfs + zenity + xdg-open. For ubuntu, xdg-open is part
of xdg-utils and is installed by default. E.g. for ubuntu, you can
install [encfs](http://www.arg0.net/encfs) and
[zenity](http://live.gnome.org/Zenity) with the following command:

    sudo aptitude install encfs zenity

### INSTALLATION

Unpack this archive, or pull a copy the sources, and then type:

    sudo make install

which copies encfsui to `/usr/local/bin`. Alternately, just copy
`encfsui` anywhere in your path, e.g. to `~/bin`.

Copy the sample `encfsui.desktop` file to your `~/Desktop`.

### USAGE

    encfsui [-options] source_enc_dir target_mount_dir

    Mount source_enc_dir to target_mount_dir.

    If target already mounted then it will be unmounted instead.

    Options:
    -i <mins> specify idle timeout mins
    -p (make public mount, can only be done by root)
    -o (don't open target dir in gui mode)

Just create a shortcut for this command on your GUI desktop (e.g. see
sample `encfsui.desktop`), specifying your private source (encfs) and
target (mountpoint) directories. I assign the gnome icon
`/usr/share/pixmaps/seahorse/48x48/seahorse-key-personal.png` which
gives a nice padlock + personal icon.

Of course you can create multiple encfs source + target directories,
each with a corresponding desktop shortcut if you want.

### LICENSE

Copyright (C) 2010 Mark Blakeney. This program is distributed under the
terms of the GNU General Public License.

This program is free software: you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by the
Free Software Foundation, either version 3 of the License, or any later
version.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
Public License at <http://www.gnu.org/licenses/> for more details.
