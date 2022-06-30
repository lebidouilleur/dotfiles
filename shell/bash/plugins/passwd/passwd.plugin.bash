### passwd.plugin.bash ---                          -*- mode: shell-script;  -*-

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

## Adapted from:
## https://blog.sleeplessbeastie.eu/2016/04/11/how-to-generate-random-password-using-command-line/

### Code:



function generate_password {
    # Use `pwgen' or `apg' as default for better password generation.
    if (assert_string_not_empty "$1" && assert_geq "$1" 0)
    then
        if command_exists pwgen
        then
            password=$(pwgen -s -N 1 -cny $1)
        elif command_exists apg
        then
            password=$(apg -m $1 -x 1 -M SNCL -a 1 -n 1);
        else
            password=$(head /dev/urandom | LC_CTYPE=C tr -dc '[:graph:]' | fold -w$1 | sed '$d' | shuf -n1);
        fi
    fi

    echo $password
}



alias passwd=color_password
function color_password {
    # Generate 16-length password by default
    (assert_string_not_empty "$1" && assert_gt "$1" 0) && N=$1 || N=16 ;

    while read -n1 character
    do
      case $character in
        [0-9]) echo -ne "$TEXT_FORMAT_NOESC_FOREGROUND_BLUE${character}$TEXT_FORMAT_NOESC_RESET"   ;;
        [a-z]) echo -ne "$TEXT_FORMAT_NOESC_FOREGROUND_RED${character}$TEXT_FORMAT_NOESC_RESET"    ;;
        [A-Z]) echo -ne "$TEXT_FORMAT_NOESC_FOREGROUND_YELLOW${character}$TEXT_FORMAT_NOESC_RESET" ;;
        *)     echo -ne "$TEXT_FORMAT_NOESC_FOREGROUND_GREEN${character}$TEXT_FORMAT_NOESC_RESET"  ;;
      esac
    done < <(echo -n "$(generate_password $N)");
    echo;
}
