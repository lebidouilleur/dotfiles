### μdevtools.sh ---                                            -*- mode: sh; -*-

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



# Unless running interactively do not go any further.
case $- in
    *i*)        ;;
      *) return ;;
esac


if [ "$ENABLE_DEBUGGING" = "true" ]
then
    echo $BASH_VERSION
fi


# Used variables must be initialized.
# set -o nounset


# Traces error in function & co.
set -o errtrace


# Use a simple SYSTEM variable to get rid of $OSTYPE
case "$OSTYPE" in
    bsd*)     SYSTEM=bsd     ;;
    freebsd*) SYSTEM=freebsd ;;
    netbsd*)  SYSTEM=netbsd  ;;
    openbsd*) SYSTEM=openbsd ;;

    darwin*)  SYSTEM=macos   ;;

    linux*)   SYSTEM=linux   ;;

    cygwin*)  SYSTEM=windows ;;
    msys*)    SYSTEM=windows ;;

    *)        SYSTEM=unknown ;;
esac


function command_exists {

    # Although we should always be in `bash'
    # let's use `type' which is POSIX compliant instead of `hash'
    type $1 >/dev/null 2>&1 ;

}


function command_flag_exists {

    # Check if flag $2 of a command $1 exists
    # From https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/grep.zsh#L9
    echo | $1 $2 "" >/dev/null 2>&1 ;

}


function commands_required {

    # Check if commands in $@ exists.
    for cmd in $@
    do
        if ! command_exists $cmd
        then
            required+=($cmd)
        fi
    done

    (( ${#required[@]} > 0 )) && return 1 || return 0
}
