### mount.plugin.bash ---                            -*- mode: shell-script; -*-

## Copyright (C) 2021  lebidouilleur

## Author: lebidouilleur <lebidouilleur@icloud.com>
## Keywords:

## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.

## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.

## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

### Commentary:

##

### Code:




function ntfs-mount {
    if ! sh.system.commands_required ntfs-3g
    then
        echo "'ntfs-3g' is required..."
        return 1
    fi

    if ! assert_directory_exists "/Volumes/NTFS"
    then
        sudo mkdir /Volumes/NTFS
    fi

    sudo /usr/local/bin/ntfs-3g "$1" /Volumes/NTFS -olocal -oallow_other
}
