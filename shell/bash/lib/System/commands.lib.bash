### commands.lib.bash ---                            -*- mode: shell-script; -*-

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



function sh.system.command_exists {

    # Although we should always be in `bash'
    # let's use `type' which is POSIX compliant instead of `hash'
    type $1 >/dev/null 2>&1 ;

}


function sh.system.command_flag_exists {

    # Check if flag $2 of a command $1 exists
    # From https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/grep.zsh#L9
    echo | $1 $2 "" >/dev/null 2>&1 ;

}


function sh.system.commands_required {

    # Check if commands in $@ exists.
    for cmd in $@
    do
        if ! sh.system.command_exists $cmd
        then
            required+=($cmd)
        fi
    done

    (( ${#required[@]} > 0 )) && return 1 || return 0
}
