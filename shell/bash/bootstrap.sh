### bootstrap.sh ---                                -*- mode: shell-script;  -*-

## Copyright (C) 2021  lebidoulleur

## Author: lebidoulleur <lebidoulleur@icloud.com>
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



# See: https://unix.stackexchange.com/a/285928
# Check if GNU/Bash version is >= $BASH_MINIMUM_VERSION.
if [ ! "$(printf '%s\n' "$BASH_MINIMUM_VERSION" "$BASH_VERSION" | sort -V | head -n1)" = "$BASH_MINIMUM_VERSION" ]
then
    echo "Your are currently using GNU/Bash ${BASH_VERSION%.*}."
    echo "Unfortunately, this dotfile config requires GNU/Bash $BASH_MINIMUM_VERSION or above."
    echo "Consider to update GNU/Bash before using our dotfiles."
    return 1
fi
