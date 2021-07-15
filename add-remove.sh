#!/bin/bash

#    add remove script for bych4n_ubuntu.
#    Copyright (C) 2021  lazypwny751
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.


[ $UID != 0 ] && { echo "please try again with root privalages 'sudo bash $(basename $0)'" ; exit 1 ; }

checkdebian() {
    if [[ ! -e /etc/apt/sources.list.d/bych4n_debian.list ]] ; then
        echo "please use this script on Debian based distro(s)"
        exit 1
    fi
}

case ${1} in
    [aA][dD][dD]|--[aA][dD][dD]|-[aA])
        checkdebian
	curl -s --compressed "https://bych4n-group.github.io/bych4n_debian/ubuntu/KEY.gpg" | sudo apt-key add -
	sudo curl -s --compressed -o /etc/apt/sources.list.d/bych4n_debian.list "https://bych4n-group.github.io/bych4n_debian/ubuntu/bych4n_debian.list"
    	echo "metadata created."
    ;;
    [rR][eE][mM][oO][vV][eE]|--[rR][eE][mM][oO][vV][eE]|-[aA])
        [ -e /etc/apt/sources.list.d/bych4n_debian.list ] && rm /etc/apt/sources.list.d/bych4n_debian.list
    ;;
    *)
        echo "wrong usage there are two (2) flags: --add, --remove"
        exit 1
    ;;
esac
