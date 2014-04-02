#!/bin/bash
# Installation script.
# (C) Mark Blakeney, markb@berlios.de, May 2012.

PROG="encfsui"

if [ "$(id -un)" = "root" ]; then
    BINDIR="/usr/bin"
    APPDIR="/usr/share/applications"
else
    BINDIR="$HOME/bin"
    APPDIR="$HOME/.local/share/applications"
fi

usage() {
    echo "Usage: $(basename $0) [-options]"
    echo "Options:"
    echo "-r <remove/uninstall>"
    echo "-l <list only>"
    exit 1
}

REMOVE=0
LIST=0
while getopts rl c; do
    case $c in
    r) REMOVE=1;;
    l) LIST=1;;
    ?) usage;;
    esac
done

shift $((OPTIND - 1))

if [ $# -ne 0 ]; then
    usage
fi

# Delete or list file/dir
clean() {
    local tgt=$1

    if [ -e $tgt -o -h $tgt ]; then
	if [ -d $tgt ]; then
	    if [ $REMOVE -eq 1 ]; then
		echo "Removing $tgt/"
		rm -rf $tgt
		return 0
	    else
		ls -ld $tgt/
	    fi
	elif [ $REMOVE -ne 0 ]; then
	    echo "Removing $tgt"
	    rm -r $tgt
	    return 0
	else
	    ls -l $tgt
	fi
    fi

    return 1
}

if [ $REMOVE -eq 0 -a $LIST -eq 0 ]; then
    mkdir -p $BINDIR
    install -CDv $PROG -t $BINDIR
    mkdir -p $APPDIR
    install -CDv -m 644 $PROG.desktop -t $APPDIR
else
    if clean $BINDIR/$PROG; then
	rmdir --ignore-fail-on-non-empty $BINDIR
    fi
    clean $APPDIR/$PROG.desktop
fi

if [ -x /usr/bin/update-desktop-database ]; then
    /usr/bin/update-desktop-database -q
fi

exit 0
