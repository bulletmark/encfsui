## ENCRYPTED FILESYSTEM [ENCFS](http://www.arg0.net/encfs) GUI WRAPPER

This bash script provides a simple gui around the
[encfs](http://www.arg0.net/encfs) command line utility to mount
and unmount an encrypted directory. This script requires
[encfs](http://www.arg0.net/encfs),
[zenity](http://live.gnome.org/Zenity), and
[xdg-open](http://portland.freedesktop.org/wiki/).

Whenever you want to mount your private directory, you click on the
desktop launcher. The launcher runs the script with appropriate
directory arguments. The script uses
[zenity](http://live.gnome.org/Zenity) to prompt you for the passphrase
and then mounts the [encfs](http://www.arg0.net/encfs) directory. If you
click on the launcher when the private directory is already mounted,
then you are prompted to unmount it. There are some other options, see
usage below.

My motivation for creating this script was to give simple and quick one
click access to a single encrypted personal directory. I do not want my
passphrase cached anywhere, and I want an single click way to close off
access.

A sample desktop launcher file (`encfsui.desktop`) is included.

Home: <http://github.com/bulletmark/encfsui>  
Author: Mark Blakeney, <markb@berlios.de>

### PREREQUISITES

Requires bash + encfs + zenity + xdg-open. For ubuntu, xdg-open is part
of xdg-utils and is installed by default. E.g. for ubuntu, you can
install [encfs](http://www.arg0.net/encfs) and
[zenity](http://live.gnome.org/Zenity) with the following command:

    sudo apt-get install encfs zenity

*Note zenity seems installed by default now in Ubuntu 12.04.*

### INSTALLATION

Unpack this archive, or git pull a copy of the sources.

To install for your own personal use, type:

    make install

which copies encfsui to `$HOME/bin/` and encfsui.desktop to
`$HOME/.local/share/applications/`.

Alternately, to install in a system system area for all users type:

    sudo make install

which copies encfsui to `/usr/bin/` and encfsui.desktop to
`/usr/share/applications/`.

On Ubuntu Unity or Gnome Shell, you can search for encfsui in your
applications list to start it, or drag add it to your Unity or Gnome
Shell launcher for convenience. Of course you can create multiple encfs
source + target directories, each with corresponding desktop
launchers, if you want to specify their commands with different source
and target dirs in the command line, as described next.

### USAGE

    encfsui [-options] source_enc_dir target_mount_dir

    GUI utility to mount source_enc_dir to target_mount_dir.
    If target already mounted then it will be unmounted instead.

    Options:
    -i <mins> specify idle timeout mins
    -p (make public mount, can only be done by root)
    -o (don't open target dir in gui mode)

### LICENSE

Copyright (C) 2012 Mark Blakeney. This program is distributed under the
terms of the GNU General Public License.

This program is free software: you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by the
Free Software Foundation, either version 3 of the License, or any later
version.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
Public License at <http://www.gnu.org/licenses/> for more details.

<!-- vim: se ai syn=markdown: -->
