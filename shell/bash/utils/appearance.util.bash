### appearance.util.bash ---                         -*- mode: shell-script; -*-

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

#

### Code:



if [ "$ENABLE_LS_COLORS" = "true" ]
then
    # Enable colors in `ls' output
    export LSCOLORS="ExFxBxDxCxegedabagacad"


    case $SYSTEM in
        macos) # NOTE: On macOS, using `exa` or `gls' (from `coreutils`) require to load Homebrew BEFORE this script.
            if sh.system.command_exists exa
            then
               alias ls="exa      --color=auto --icons --group-directories-first"
               alias la="exa -ahl --color=auto --icons --group-directories-first"
            elif sh.system.command_exists gls
            then
                alias ls='gls -GhvX --group-directories-first --color=tty'
            else
                alias ls='ls -G'
            fi
            ;;

        linux) # NOTE: On GNU/Linux GNU `coreutils' should already be installed and will be default if `exa` is not.
            if sh.system.command_exists exa
            then
               alias ls="exa      --color=auto --icons --group-directories-first"
               alias la="exa -ahl --color=auto --icons --group-directories-first"
            else
                alias ls='ls --color=tty'
            fi
            ;;

        freebsd) # NOTE: On FreeBSD, using `exa` or `gls' (from `coreutils`) require them to be installed.
            if sh.system.command_exists exa
            then
               alias ls="exa      --color=auto --icons --group-directories-first"
               alias la="exa -ahl --color=auto --icons --group-directories-first"
            elif sh.system.command_exists gls
            then
                alias ls='gls -GhvX --group-directories-first --color=tty'
            else
                alias ls='ls -G'
            fi
            ;;

        netbsd) # NOTE: On NetBSD, using `exa` or `gls' (from `coreutils`) require them to be installed.
                # Otherwise do not change anything since NetBSD `ls' does not support colors.
            if sh.system.command_exists exa
            then
               alias ls="exa      --color=auto --icons --group-directories-first"
               alias la="exa -ahl --color=auto --icons --group-directories-first"
            elif sh.system.command_exists gls
            then
                alias ls='gls -GhvX --group-directories-first --color=tty'
            fi
            ;;

        openbsd) # NOTE: On OpenBSD, using `exa` or `gls' (from `coreutils`) require them to be installed.
                 # Otherwise, the default `colorls' has (obviously) colors and multibyte support, so it will be used.
            if sh.system.command_exists exa
            then
               alias ls="exa      --color=auto --icons --group-directories-first"
               alias la="exa -ahl --color=auto --icons --group-directories-first"
            elif sh.system.command_exists gls
            then
                alias ls='gls -GhvX --group-directories-first --color=tty'
            elif sh.system.command_exists colorls
            then
                alias ls='colorls -G'
            fi
            ;;

    esac
fi





if [ "$ENABLE_GREP_COLORS" = "true" ]
then
    # Enable colors in `grep's output
    export GREP_COLORS='ms=01;31:mc=01;32:sl=:cx=:fn=35:ln=32:bn=32:se=36'


    # use `ripgrep` as default when instaled.
    if sh.system.command_exists rg
    then
        alias grep="rg"
    elif sh.system.command_exists ggrep
    then
        alias grep='ggrep --color=always'
    else
        alias grep='grep --color=always'
    fi
fi


