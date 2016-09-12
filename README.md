## ENCRYPTED FILESYSTEM [ENCFS](http://www.arg0.net/encfs) GUI WRAPPER

[Encfsui](https://github.com/bulletmark/encfsui) is a bash script which
provides a simple gui around the
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

See example screenshots at https://github.com/bulletmark/encfsui/wiki.

The latest version and documentation is available at
http://github.com/bulletmark/encfsui.

### INSTALLATION

NOTE: Arch users can just install [_encfsui from the
AUR_](https://aur.archlinux.org/packages/encfsui/) and skip to the next
section. Other users can install the following:

    # Install encfs zenity xdg-utils
    git clone http://github.com/bulletmark/arch-upgrade
    cd arch-upgrade
    sudo make install

### USAGE

The installation procedure creates a desktop application _encfsui_ which
you can run from your DE. By default, _encfsui_ mounts your encrypted
`~/.Private` dir to unencrypted `~/Private` with an in-activity timeout
of 60 minutes. So you should first create an 
[encfs](http://www.arg0.net/encfs) `~/.Private` directory.
See `man encfs` for details on how to do this.

You can also copy the
`/usr/share/applications/encfsui.desktop` launcher to your own Desktop
Launcher in `~/.local/share/applications/` (with a custom name) to
use different directory names or timeout etc.

The utility can also be run from the command line. The usage is:

    encfsui [-options] source_enc_dir target_mount_dir

    GUI utility to mount source_enc_dir to target_mount_dir.
    If target already mounted then it will be unmounted instead.

    Options:
    -i <mins> specify idle timeout mins
    -p (make public mount, can only be done by root)
    -o (don't open target dir in gui mode)

### CLEANUP OF OLD CONFIGURATION

Note that _encfsui_ now installs system-wide but old versions installed
as local user files so to ensure that any old user configuration is
removed type the following as your normal user (i.e. not sudo/root).

    encfsui-setup clean

You can type this any time so no harm is done running it to make sure.

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
