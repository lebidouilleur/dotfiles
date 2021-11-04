### extract.plugin.bash ---                          -*- mode: shell-script; -*-

## Copyright (C) 2020  lebidouilleur

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




alias x=extract
function extract {
    usage=<<EOF
Usage: ${FUNCNAME[0]} [option] <archives> ...
    options:
        -h  show this message and exit
        -v  verbosely list files processed
EOF

    if assert_eq 0 $#
    then
        echo ${usage}
        return
    fi

    # no-verbose some unarchiver by default
    local zipverbose='-qq' # quiet zip
    local rarverbose='q' # quiet rar

    while getopts ":hv" options
    do
        case $options in
            v)
                local -r verbose='v'
                local -r zipverbose='' # unquiet zip
                local -r rarverbose='' # unquiet rar
                ;;
            h|?)
                echo ${usage}
                return
                ;;
        esac
    done
    shift $((OPTIND-1))

    while assert_gt $# 0
    do
        if assert_file_exists "$1"
        then
            if assert_string_eq "$verbose" "v"
            then
                echo "Extracting '$1'..."
            else
                echo "Extracting '$1'..."
            fi

            case "$1" in
                *.tar)                   tar x${verbose}f  "$1" ;;
                *.tar.bz2|*.tbz|*.tbz2)  tar x${verbose}jf "$1" ;;
                *.tar.gz|*.tgz)          tar x${verbose}zf "$1" ;;
                *.tar.xz|*.txz)          tar --xz -x${verbose}f "$1" ;;
                *.tar.zma|*.tlz)         tar --lzma -x${verbose}f "$1" ;;
                *.bz2)                   bunzip2 "$1" ;;
                *.gz)                    gunzip "$1" ;;
                *.xz)                    unxz "$1" ;;
                *.lzma)                  unlzma "$1" ;;
                *.7z)                    7za x "$1" ;;
                *.Z)                     uncompress "$1" ;;
                *.zip|*.cbz|*.jar|*.apk) unzip ${zipverbose} "$1" -d .tmp &&
                                         mkdir "${1:0:-4}"     &&
                                         mv .tmp/* "${1:0:-4}" &&
                                         rm -rf .tmp ;;
                *.xpi)                   unzip ${zipverbose} "$1" -d .tmp &&
                                         mkdir "${1:0:-4}"     &&
                                         mv .tmp/* "${1:0:-4}" &&
                                         rm -rf .tmp ;;
                *.ipsw)                  unzip ${zipverbose} "$1" -d .tmp &&
                                         mkdir "${1:0:-5}"     &&
                                         mv .tmp/* "${1:0:-5}" &&
                                         rm -rf .tmp ;;
                *.rar|*.cbr)             unrar x -id${rarverbose} -ad "$1" ;;

                *.deb)                   dpkg-deb -x${verbose} "$1" "${1:0:-4}" ;;
                *.rpm)                   rpm2cpio "$1" | cpio -idm${verbose} ;;
                *.pkg)                   pkgutil --expand "$1" "${1:0:-4}" ;;

                *) echo "'$1' cannot be extracted via ${FUNCNAME[0]}..." ;;
            esac

            echo "Extracting '$1'..."
        else
            echo "'$1' does not exist..."
            return 1
        fi
        shift
    done
}
